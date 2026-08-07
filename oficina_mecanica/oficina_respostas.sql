# Respostas SQL para as perguntas da Oficina Mecânica

## Recuperações simples com SELECT Statement

1. Quais são todos os clientes cadastrados no sistema?
```sql
SELECT * FROM clientes;
```

2. Liste todos os veículos registrados na oficina.
```sql
SELECT * FROM veiculos;
```

3. Mostre todas as ordens de serviço abertas.
```sql
SELECT * FROM ordens_servico WHERE status_ordem = 'aberta';
```

4. Quais são todos os mecânicos cadastrados?
```sql
SELECT * FROM mecanicos;
```

5. Liste todos os serviços disponíveis na oficina.
```sql
SELECT * FROM servicos;
```

## Filtros com WHERE Statement

6. Quais clientes moram em São Paulo?
```sql
SELECT * FROM clientes WHERE estado = 'SP';
```

7. Liste todos os veículos da marca Volkswagen.
```sql
SELECT * FROM veiculos WHERE marca = 'Volkswagen';
```

8. Mostre as ordens de serviço com status "em andamento".
```sql
SELECT * FROM ordens_servico WHERE status_ordem = 'em andamento';
```

9. Quais peças estão com estoque abaixo de 10 unidades?
```sql
SELECT * FROM pecas WHERE estoque < 10;
```

10. Liste os mecânicos contratados após 01/01/2020.
```sql
SELECT * FROM mecanicos WHERE data_contratacao > '2020-01-01';
```

## Expressões para gerar atributos derivados

11. Qual é o valor total de cada ordem de serviço (considerando serviços e peças)?
```sql
SELECT os.id_ordem,
       COALESCE(SUM(io.quantidade * io.preco_unitario), 0) + 
       COALESCE(SUM(po.quantidade * po.preco_unitario), 0) AS valor_total
FROM ordens_servico os
LEFT JOIN itens_ordem io ON os.id_ordem = io.id_ordem
LEFT JOIN pecas_ordem po ON os.id_ordem = po.id_ordem
GROUP BY os.id_ordem;
```

12. Mostre o nome das peças e seus preços com um desconto de 15%.
```sql
SELECT nome_peca, preco, (preco * 0.85) AS preco_com_desconto
FROM pecas;
```

13. Liste os clientes com sua idade calculada a partir da data de nascimento.
```sql
SELECT nome, data_nascimento, 
       TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM clientes;
```

14. Qual o valor total de cada ordem com acréscimo de mão de obra de R$ 50,00?
```sql
SELECT os.id_ordem,
       COALESCE(SUM(io.quantidade * io.preco_unitario), 0) + 
       COALESCE(SUM(po.quantidade * po.preco_unitario), 0) AS valor_produtos,
       COALESCE(SUM(io.quantidade * io.preco_unitario), 0) + 
       COALESCE(SUM(po.quantidade * po.preco_unitario), 0) + 50.00 AS valor_total_com_mao_obra
FROM ordens_servico os
LEFT JOIN itens_ordem io ON os.id_ordem = io.id_ordem
LEFT JOIN pecas_ordem po ON os.id_ordem = po.id_ordem
GROUP BY os.id_ordem;
```

15. Mostre os serviços com seu preço em dólares (considerando 1 dólar = R$ 5,00).
```sql
SELECT nome_servico, preco_base, (preco_base / 5.00) AS preco_dolar
FROM servicos;
```

## Ordenações dos dados com ORDER BY

16. Liste todos os serviços ordenados por preço, do mais caro ao mais barato.
```sql
SELECT * FROM servicos ORDER BY preco_base DESC;
```

17. Mostre os clientes ordenados por data de cadastro, do mais recente ao mais antigo.
```sql
SELECT * FROM clientes ORDER BY data_cadastro DESC;
```

18. Liste as ordens de serviço ordenadas por valor total, da maior para a menor.
```sql
SELECT os.id_ordem,
       COALESCE(SUM(io.quantidade * io.preco_unitario), 0) + 
       COALESCE(SUM(po.quantidade * po.preco_unitario), 0) AS valor_total
FROM ordens_servico os
LEFT JOIN itens_ordem io ON os.id_ordem = io.id_ordem
LEFT JOIN pecas_ordem po ON os.id_ordem = po.id_ordem
GROUP BY os.id_ordem
ORDER BY valor_total DESC;
```

19. Quais peças estão ordenadas alfabeticamente por nome?
```sql
SELECT * FROM pecas ORDER BY nome_peca ASC;
```

20. Mostre as ordens de serviço ordenadas por data de abertura, da mais antiga à mais recente.
```sql
SELECT * FROM ordens_servico ORDER BY data_abertura ASC;
```

## Condições de filtros aos grupos – HAVING Statement

21. Quais mecânicos atenderam mais de 2 ordens de serviço?
```sql
SELECT m.nome, COUNT(os.id_ordem) AS qtd_ordens
FROM mecanicos m
JOIN ordens_servico os ON m.id_mecanico = os.id_mecanico
GROUP BY m.id_mecanico
HAVING COUNT(os.id_ordem) > 2;
```

22. Liste os clientes que possuem mais de 1 veículo cadastrado.
```sql
SELECT c.nome, COUNT(v.id_veiculo) AS qtd_veiculos
FROM clientes c
JOIN veiculos v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente
HAVING COUNT(v.id_veiculo) > 1;
```

23. Quais peças têm estoque médio maior que 15 unidades por fornecedor?
```sql
SELECT fornecedor, AVG(estoque) AS estoque_medio
FROM pecas
GROUP BY fornecedor
HAVING AVG(estoque) > 15;
```

24. Mostre as especialidades de mecânicos cujo salário médio é superior a R$ 3.000,00.
```sql
SELECT especialidade, AVG(salario) AS salario_medio
FROM mecanicos
GROUP BY especialidade
HAVING AVG(salario) > 3000.00;
```

25. Liste as marcas de veículos que possuem mais de 1 veículo cadastrado.
```sql
SELECT marca, COUNT(*) AS qtd_veiculos
FROM veiculos
GROUP BY marca
HAVING COUNT(*) > 1;
```

## Junções entre tabelas para perspectiva complexa dos dados

26. Quantas ordens de serviço foram feitas por cada cliente? (JOIN entre clientes e veículos e ordens)
```sql
SELECT c.nome, COUNT(os.id_ordem) AS qtd_ordens
FROM clientes c
LEFT JOIN veiculos v ON c.id_cliente = v.id_cliente
LEFT JOIN ordens_servico os ON v.id_veiculo = os.id_veiculo
GROUP BY c.id_cliente;
```

27. Qual o valor total gasto por cada cliente em todos os serviços? (JOIN múltipla)
```sql
SELECT c.nome, 
       COALESCE(SUM(io.quantidade * io.preco_unitario), 0) + 
       COALESCE(SUM(po.quantidade * po.preco_unitario), 0) AS valor_total_gasto
FROM clientes c
LEFT JOIN veiculos v ON c.id_cliente = v.id_cliente
LEFT JOIN ordens_servico os ON v.id_veiculo = os.id_veiculo
LEFT JOIN itens_ordem io ON os.id_ordem = io.id_ordem
LEFT JOIN pecas_ordem po ON os.id_ordem = po.id_ordem
GROUP BY c.id_cliente;
```

28. Liste os veículos e seus respectivos proprietários (clientes).
```sql
SELECT v.marca, v.modelo, v.placa, c.nome AS proprietario
FROM veiculos v
JOIN clientes c ON v.id_cliente = c.id_cliente;
```

29. Mostre as ordens de serviço com seus respectivos mecânicos e veículos atendidos.
```sql
SELECT os.id_ordem, m.nome AS mecanico, v.marca, v.modelo, v.placa, os.status_ordem
FROM ordens_servico os
JOIN mecanicos m ON os.id_mecanico = m.id_mecanico
JOIN veiculos v ON os.id_veiculo = v.id_veiculo;
```

30. Qual a quantidade total de peças utilizadas em cada ordem de serviço?
```sql
SELECT os.id_ordem, COALESCE(SUM(po.quantidade), 0) AS qtd_total_pecas
FROM ordens_servico os
LEFT JOIN pecas_ordem po ON os.id_ordem = po.id_ordem
GROUP BY os.id_ordem;
```

31. Liste os mecânicos e as ordens de serviço que eles atenderam com os serviços realizados.
```sql
SELECT m.nome AS mecanico, os.id_ordem, s.nome_servico, io.quantidade
FROM mecanicos m
JOIN ordens_servico os ON m.id_mecanico = os.id_mecanico
JOIN itens_ordem io ON os.id_ordem = io.id_ordem
JOIN servicos s ON io.id_servico = s.id_servico
ORDER BY m.nome, os.id_ordem;
```

32. Qual o ticket médio das ordens de serviço por mecânico?
```sql
SELECT m.nome, 
       COALESCE(AVG(valor_ordem.valor), 0) AS ticket_medio
FROM mecanicos m
LEFT JOIN ordens_servico os ON m.id_mecanico = os.id_mecanico
LEFT JOIN (
    SELECT os2.id_ordem, 
           COALESCE(SUM(io2.quantidade * io2.preco_unitario), 0) + 
           COALESCE(SUM(po2.quantidade * po2.preco_unitario), 0) AS valor
    FROM ordens_servico os2
    LEFT JOIN itens_ordem io2 ON os2.id_ordem = io2.id_ordem
    LEFT JOIN pecas_ordem po2 ON os2.id_ordem = po2.id_ordem
    GROUP BY os2.id_ordem
) AS valor_ordem ON os.id_ordem = valor_ordem.id_ordem
GROUP BY m.id_mecanico;
```

33. Mostre as peças que nunca foram utilizadas em ordens de serviço.
```sql
SELECT p.nome_peca
FROM pecas p
LEFT JOIN pecas_ordem po ON p.id_peca = po.id_peca
WHERE po.id_peca IS NULL;
```

34. Liste os clientes que fizeram serviços de uma determinada especialidade (ex: Motor).
```sql
SELECT DISTINCT c.nome
FROM clientes c
JOIN veiculos v ON c.id_cliente = v.id_cliente
JOIN ordens_servico os ON v.id_veiculo = os.id_veiculo
JOIN mecanicos m ON os.id_mecanico = m.id_mecanico
WHERE m.especialidade = 'Motor';
```

35. Qual o serviço mais realizado na oficina?
```sql
SELECT s.nome_servico, COUNT(io.id_servico) AS qtd_realizada
FROM servicos s
JOIN itens_ordem io ON s.id_servico = io.id_servico
GROUP BY s.id_servico
ORDER BY qtd_realizada DESC
LIMIT 1;