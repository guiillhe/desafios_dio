# Automação N8N — Resumo Diário de Compromissos (Google Calendar → WhatsApp)

## Objetivo
Toda manhã, de segunda a sexta, receber **uma única mensagem no WhatsApp** com todos os compromissos do dia — com mensagem motivacional na segunda-feira e mensagem de "sextou" na sexta-feira.

## Arquitetura do fluxo
```
[Schedule Trigger (07:00, seg–sex)]
        ↓
[Google Calendar — Get Calendar Events (eventos de hoje)]
        ↓
[IF — existe algum evento?] ── Não ──> [Encerra (ou envia "sem compromissos")]
        ↓ Sim
[Code — monta a mensagem consolidada]
        ↓
[WhatsApp Business Cloud — Send Message (1 única mensagem)]
```

## Nós utilizados e lógica de funcionamento

### 1. Schedule Trigger (Trigger)
- **Função:** dispara o workflow no horário configurado, apenas em dias úteis.
- **Configuração:**
  - Trigger Interval: `Days`
  - Hora: `07:00` (ajustável)
  - Opção **Execute on Weekdays**: ativada → garante a regra de segunda a sexta sem lógica extra.
  - Alternativa: Cron Expression `0 7 * * 1-5`
- **Timezone:** definir em Workflow Settings → Timezone = `America/Sao_Paulo`, para o disparo respeitar o horário local.

### 2. Google Calendar — Get Calendar Events (Action)
- **Função:** busca todos os compromissos do dia corrente.
- **Configuração:**
  - Credential: Google OAuth2 (escopo de leitura do calendário)
  - Resource: `Event` | Operation: `Get Many`
  - Calendar ID: `primary`
  - Return All: `true`
  - Time Range: `Custom`
    - Start Time: `{{ $now.startOf('day').toISO() }}`
    - End Time: `{{ $now.endOf('day').toISO() }}`
  - Filter: `singleEvents=true&orderBy=startTime`
    - **Crítico:** `singleEvents=true` expande eventos recorrentes. Sem isso, séries recorrentes retornam com a data original e não aparecem no dia correto.
- **Regra #1 atendida aqui:** o intervalo custom garante que só entram os compromissos do dia em questão.

### 3. IF — Existem compromissos? (Logic)
- **Função:** ramifica o fluxo conforme haja ou não eventos.
- **Condição:** `{{ Object.keys($json).length >0 }}`
- **Branch True:** segue para o nó Code (montar mensagem).
- **Branch False:** encerra silenciosamente (recomendado) ou envia "Sem compromissos hoje" — decisão de produto.

### 4. Code — Montar mensagem consolidada (Code)
- **Função:** itera os eventos, ordena por horário, formata a mensagem única e aplica as regras de segunda/sexta.
- **Regras aplicadas:**
  - Ordenação por horário de início.
  - Formato por evento: `HH:mm — Título` (eventos de dia inteiro: `Dia inteiro — Título`).
  - Segunda-feira (`getDay() === 1`): prefixo motivacional.
  - Sexta-feira (`getDay() === 5`): sufixo "Sextou!".
- **Exemplo de código:**
```javascript
const events = $input.all()
  .map(item => item.json)
  .filter(ev => ev.start && (ev.start.dateTime || ev.start.date))
  .sort((a, b) =>
    new Date(a.start.dateTime || a.start.date) -
    new Date(b.start.dateTime || b.start.date)
  );

const lines = events.map(ev => {
  if (ev.start.dateTime) {
    const t = new Date(ev.start.dateTime).toLocaleTimeString('pt-BR', {
      hour: '2-digit',
      minute: '2-digit'
    });
    return `• ${t} — ${ev.summary}`;
  }
  return `• Dia inteiro — ${ev.summary}`;
});

const hoje = new Date().toLocaleDateString('pt-BR', {
  weekday: 'long',
  day: '2-digit',
  month: '2-digit'
});

let message = '';

if (new Date().getDay() === 1) {
  message += '🌟 Bom dia! Que a semana seja produtiva e cheia de conquistas!\n\n';
}

message += `📅 Compromissos de hoje ($${hoje}):\n\n$${lines.join('\n')}`;

if (new Date().getDay() === 5) {
  message += '\n\n🎉 Sextou! Aproveite o fim de semana!';
}

return [{ json: { message } }];
```

### 5. WhatsApp Business Cloud — Send Message (Action)
- **Função:** entrega a mensagem única via WhatsApp.
- **Configuração:**
  - Credential: WhatsApp Business Cloud (Meta) — exige conta Business, Phone Number ID e access token.
  - Operation: `Send Message` | Message Type: `Text`
  - To: número de destino com DDI (ex.: `5511999999999`)
  - Message: `{{ $json.message }}`
- **Alternativas:** Twilio WhatsApp (custo por mensagem) ou nó comunitário (Baileys, não oficial — não recomendado para produção).

### 6. (Opcional) Error Trigger — resiliência
- Workflow secundário com **Error Trigger** notifica via WhatsApp/e-mail se o fluxo principal falhar (credencial expirada, API fora do ar etc.).

## Regras de negócio → onde são resolvidas

| Regra | Onde é resolvida |
|---|---|
| 1. Somente compromissos do dia | Google Calendar com Time Range custom (startOf/endOf day) |
| 2. Segunda a sexta | Schedule Trigger com "Execute on Weekdays" (ou cron `0 7 * * 1-5`) |
| 3. Mensagem motivacional na segunda | Code node (`getDay() === 1`) prefixa a mensagem |
| 4. "Sextou" na sexta | Code node (`getDay() === 5`) sufixa a mensagem |
| Mensagem única | Code node consolida tudo em um único texto; WhatsApp envia 1x |

## Boas práticas
- Configurar **timezone** do workflow (`America/Sao_Paulo`).
- Usar `singleEvents=true` para eventos recorrentes.
- Testar com um horário próximo antes de fixar o agendamento.
- Monitorar credenciais: OAuth do Google expira e o token da Meta exige renovação periódica.