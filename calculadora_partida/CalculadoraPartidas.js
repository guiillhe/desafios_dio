const readline = require('readline');
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let vitorias;
let derrotas;

function calcularNivel(vitorias, derrotas) {
  const saldoVitorias = vitorias - derrotas;
  let nivel;

  if (vitorias < 10) {
    nivel = 'Ferro';
  } else if (vitorias <= 20) {
    nivel = 'Bronze';
  } else if (vitorias <= 50) {
    nivel = 'Prata';
  } else if (vitorias <= 80) {
    nivel = 'Ouro';
  } else if (vitorias <= 90) {
    nivel = 'Diamante';
  } else if (vitorias <= 100) {
    nivel = 'Lendário';
  } else {
    nivel = 'Imortal';
  }

  console.log(`O Herói tem um saldo de ${saldoVitorias} e está no nível de ${nivel}`);
}

function obterVitorias() {
  rl.question('Digite a quantidade de vitórias: ', (vitoriasInput) => {
    vitorias = parseInt(vitoriasInput);
    obterDerrotas();
  });
}

function obterDerrotas() {
  rl.question('Digite a quantidade de derrotas: ', (derrotasInput) => {
    derrotas = parseInt(derrotasInput);
    rl.close();
    calcularNivel(vitorias, derrotas);
  });
}

obterVitorias();
