const pokemonList = document.getElementById('pokemonList')
const loadMoreButton = document.getElementById('loadMoreButton')
const pokemonDetail = document.getElementById('pokemonDetail')

const maxRecords = 151
const limit = 10
let offset = 0;
let selectedPokemon = null;

function convertPokemonToLi(pokemon) {
    return `
        <li class="pokemon ${pokemon.type}" data-pokemon-id="${pokemon.number}" onclick="showPokemonDetails(${pokemon.number})">
            <span class="number">#${pokemon.number}</span>
            <span class="name">${pokemon.name}</span>

            <div class="detail">
                <ol class="types">
                    ${pokemon.types.map((type) => `<li class="type ${type}">${type}</li>`).join('')}
                </ol>

                <img src="${pokemon.photo}" alt="${pokemon.name}">
            </div>
        </li>
    `
}

function showPokemonDetails(pokemonId) {
    // Remover seleção anterior
    document.querySelectorAll('.pokemon.selected').forEach(p => p.classList.remove('selected'));
    
    // Adicionar seleção ao card clicado
    const selectedCard = document.querySelector(`.pokemon[data-pokemon-id="${pokemonId}"]`);
    if (selectedCard) {
        selectedCard.classList.add('selected');
    }
    
    // Buscar detalhes do Pokémon
    pokeApi.getPokemons(pokemonId - 1, 1).then(pokemons => {
        if (pokemons && pokemons.length > 0) {
            const pokemon = pokemons[0];
            selectedPokemon = pokemon;
            renderPokemonDetail(pokemon);
        }
    });
}

function renderPokemonDetail(pokemon) {
    // Get the primary type for background color
    const primaryType = pokemon.types[0] || 'normal';

    const detailHtml = `
        <div class="pokemon-detail-card">
            <div class="image-header ${primaryType}">
            <h2>${pokemon.name} <span>#${pokemon.number}</span></h2>

            <div class="expanded-header">
                <ol class="types">
                    ${pokemon.types.map((type) => `<li class="type ${type}">${type}</li>`).join('')}
                </ol>
            </div>

            <div class="pokemon-detail-image">
                <img src="${pokemon.photo}" alt="${pokemon.name}">
            </div>
            </div>
        
        <div class="detail-section">
            <h3>Informações</h3>
            <div class="info-grid">
                <div class="info-item">
                    <span class="info-label">Altura</span>
                    <span class="info-value">${pokemon.height / 10} m</span>
                </div>
                <div class="info-item">
                    <span class="info-label">Peso</span>
                    <span class="info-value">${pokemon.weight / 10} kg</span>
                </div>
            </div>
        </div>
        
        <div class="detail-section">
            <h3>Habilidades</h3>
            <ol class="abilities">
                ${pokemon.abilities.map(ability => `<li class="ability">${ability}</li>`).join('')}
            </ol>
        </div>
        
        <div class="detail-section">
            <h3>Estatísticas</h3>
            <div class="stats">
                ${pokemon.stats.map(stat => `
                    <div class="stat">
                        <span class="stat-name">${stat.name}</span>
                        <span class="stat-value">${stat.value}</span>
                        <div class="stat-bar">
                            <div class="stat-bar-fill" style="width: ${Math.min(100, stat.value / 2)}%"></div>
                        </div>
                    </div>
                `).join('')}
            </div>
        </div>
    </div>
    `;
    
    pokemonDetail.innerHTML = detailHtml;
}

function loadPokemonItens(offset, limit) {
    pokeApi.getPokemons(offset, limit).then((pokemons = []) => {
        const newHtml = pokemons.map(convertPokemonToLi).join('')
        pokemonList.innerHTML += newHtml
    })
}

loadPokemonItens(offset, limit)

loadMoreButton.addEventListener('click', () => {
    offset += limit
    const qtdRecordsWithNexPage = offset + limit

    if (qtdRecordsWithNexPage >= maxRecords) {
        const newLimit = maxRecords - offset
        loadPokemonItens(offset, newLimit)

        loadMoreButton.parentElement.removeChild(loadMoreButton)
    } else {
        loadPokemonItens(offset, limit)
    }
})