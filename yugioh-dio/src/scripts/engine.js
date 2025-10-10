const state = {
    score:{
        playerScore: 0,
        computerScore:0,
        scoreBox: document.getElementById('score-points'),
    },

    cardSprites:{
        avatar: document.getElementById('card-image'),
        name: document.getElementById('card-name'),
        type: document.getElementById('card-type'),
    },
    fieldCards:{
        player:document.getElementById('player-field-card'),
        computer:document.getElementById('computer-field-card')
    },
    actions:{
        button:document.getElementById('next-duel'),
    }
}

const playerSides ={
    player: 'player-cards',
    computer: 'computer-cards'
}

const pathImages = './src/assets/icons/'
const cardsQuantit = 5;

const cardData = [
    {
        id:0,
        name:"Blue Eyes White Dragon",
        type:"Paper",
        img: `${pathImages}dragon.png`,
        winOf:[1],
        loseOf: [2]
    },
    {
        id:1,
        name:"Dark Magician",
        type:"Rock",
        img: `${pathImages}magician.png`,
        winOf:[2],
        loseOf: [0]
    },
    {
        id:2,
        name:"Exodia",
        type:"Scissors",
        img: `${pathImages}exodia.png`,
        winOf:[0],
        loseOf: [1]
    },
]

function getRandomCardId() {
    const randomId= Math.floor(Math.random() * cardData.length);
    return randomId
}

async function createCardImage(randomIdCard, fieldSide) {
    const cardImage = document.createElement('img');
    cardImage.className = 'card';
    cardImage.setAttribute('src', `${pathImages}card-back.png`);
    cardImage.setAttribute('width', '90px');    
    cardImage.setAttribute('data-id', randomIdCard);
    if (fieldSide=='player-cards'){
    cardImage.addEventListener('click', () => {
        setCardsField(randomIdCard, fieldSide);
    });

    cardImage.addEventListener('mouseover', () => {
        drawSelectedCard(randomIdCard);
    });
    }

    return cardImage;
}

async function drawSelectedCard(index) {
    state.cardSprites.avatar?.setAttribute("src", cardData[index].img);
    state.cardSprites.avatar?.setAttribute("height",'200px');
    state.cardSprites.name.innerText = cardData[index].name;  
    state.cardSprites.type.innerText = cardData[index].type;
}

async function drawCards(cardNumbers, fieldSide) {
    for (let i = 0; i < cardNumbers; i++) {
        const randomIdCard =  getRandomCardId();
        const cardImage = await createCardImage(randomIdCard,fieldSide)
        document.querySelector(`#${fieldSide}`).appendChild(cardImage);
    }
}

async function setCardsField(cardId, fieldSide) {
    await removeAllCardsImages();

    const computerCardId = getRandomCardId();

    state.fieldCards.computer.style.display = 'block';
    state.fieldCards.player.style.display = 'block';
    state.cardSprites.name.innerText = "Name";  
    state.cardSprites.type.innerText = "Type";
    state.cardSprites.avatar.setAttribute('src', `${pathImages}card-back.png`)
    
    state.fieldCards.player.src = `${cardData[cardId].img}`
    state.fieldCards.computer.src = `${cardData[computerCardId].img}`

    let duelResult = await determineWinner(cardId, computerCardId);

    await updateScores(duelResult);
    await drawButton(duelResult);
}

async function removeAllCardsImages() {
    const cardImages = document.querySelectorAll('.card');
    cardImages.forEach(card => card.remove());
}

async function determineWinner(cardId, computerCardId) {
    const playerCard = cardData.find(card => card.id === cardId);
    const computerCard = cardData.find(card => card.id === computerCardId);
   
    let result = "Drawn" ;
    if (playerCard.winOf.includes(computerCard.id)) {
        state.score.playerScore++;
        result = 'Win';
    } else if (playerCard.loseOf.includes(computerCard.id)) {
        state.score.computerScore++;
        result = 'Lose';
        
    }
    
    await playAudio(result)
    return result;
}

async function updateScores(result) {
    state.score.scoreBox.innerText = `Win : ${state.score.playerScore} | Lose ${state.score.computerScore}`;
}

async function drawButton(text){
    
    state.actions.button.innerText = text;
    state.actions.button.style.display = 'block';
}

function resetDuel() {    
    state.fieldCards.player.removeAttribute('src');
    state.fieldCards.computer.removeAttribute('src');
    state.actions.button.style.display = 'none';
    state.fieldCards.player.style.display = 'none';
    state.fieldCards.computer.style.display = 'none';
    init();
}
async function playAudio(status){
    
    const audio = new Audio(`./src/assets/audios/${status}.wav`);
    audio.play();
}
function init() {
    state.fieldCards.player.style.display = 'block';
    state.fieldCards.computer.style.display = 'block';
    drawCards(cardsQuantit, playerSides.player);
    drawCards(cardsQuantit, playerSides.computer);
    const bgm =document.querySelector("#bgm")

    bgm.play();

}

init();