const readline = require('readline');
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let nome;
let xp;

rl.question('Digite o nome do herói: ', (nomeInput) => {
  nome = nomeInput;

  rl.question('Digite a quantidade de experiência (XP) do herói: ', (xpInput) => {
    xp = parseInt(xpInput);

    let nivel;

    if (xp < 1000) {
      nivel = 'Ferro';
    } else if (xp <= 2000) {
      nivel = 'Bronze';
    } else if (xp <= 5000) {
      nivel = 'Prata';
    } else if (xp <= 7000) {
      nivel = 'Ouro';
    } else if (xp <= 8000) {
      nivel = 'Platina';
    } else if (xp <= 9000) {
      nivel = 'Ascendente';
    } else if (xp <= 10000) {
      nivel = 'Imortal';
    } else {
      nivel = 'Radiante';
    }

    console.log(`O Herói de nome ${nome} está no nível de ${nivel}`);
    rl.close();
  });
});
