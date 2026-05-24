let id = new URLSearchParams(window.location.search).get("id");
if (!id) window.location.href = "index.html";

const typeColors = {
    normal: { bg: "#F5F5DC", stat: "#E6E6B8" },
    fire: { bg: "#FFD6CC", stat: "#FFB3A7" },
    water: { bg: "#D6ECFF", stat: "#B3DAFF" },
    electric: { bg: "#FFF5CC", stat: "#FFE680" },
    grass: { bg: "#D9F5D9", stat: "#B8E6B8" },
    ice: { bg: "#E6FAFF", stat: "#CCF2FF" },
    fighting: { bg: "#F5D6D6", stat: "#E6B8B8" },
    poison: { bg: "#ECD6F5", stat: "#D9B3E6" },
    ground: { bg: "#F5E6CC", stat: "#E6D1A3" },
    flying: { bg: "#E6E9FF", stat: "#CCD1FF" },
    psychic: { bg: "#FFD6E6", stat: "#FFB3CC" },
    bug: { bg: "#E8F5D6", stat: "#D4E6B3" },
    rock: { bg: "#EEE2CC", stat: "#DDCC99" },
    ghost: { bg: "#E0D6F5", stat: "#C7B8E6" },
    dragon: { bg: "#D6D9FF", stat: "#B8BFFF" },
    dark: { bg: "#D6D6D6", stat: "#B8B8B8" },
    steel: { bg: "#E6E8F0", stat: "#CDD1E0" },
    fairy: { bg: "#FFE6F2", stat: "#FFCCE6" },
};
let currentColors;

document.getElementById("nextPokemon").addEventListener("click", (e) => {
    if (e.target.classList.contains("disabled")) return;

    id++;
    window.history.replaceState(null, "", "?id=" + id);
    fetchPokemon(id);
});
document.getElementById("prevPokemon").addEventListener("click", (e) => {
    if (e.target.classList.contains("disabled")) return;

    id--;
    window.history.replaceState(null, "", "?id=" + id);
    fetchPokemon(id);
});

function disableButtons() {
    const prev = document.getElementById("prevPokemon");
    prev.classList.toggle("cursor-not-allowed", id <= 1);
    prev.classList.toggle("opacity-80", id <= 1);
    prev.disabled = id <= 1;
}

function swapImage() {
    const img = document.querySelector("#summary img");
    const currentSrc = img.src;
    const normalSrc = `https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/${id}.gif`;
    const shinySrc = `https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/shiny/${id}.gif`;
    img.src = currentSrc === normalSrc ? shinySrc : normalSrc;
}

function renderSummary(pokemon) {
    const summaryContainer = document.getElementById("summary");
    summaryContainer.style.backgroundColor = colors.bg;
    summaryContainer.innerHTML = `
        <h1 class="text-3xl font-bold mb-4">${pokemon.name} [#${pokemon.id}]</h1>
        <img class="w-40 mb-4 h-[150px] w-auto" onclick="swapImage()" src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/${pokemon.id}.gif" alt="${pokemon.name} image">
        <div class="*:rounded-md *:bg-[${colors.stat}] *:py-1 *:px-2 *:mb-1 w-full text-center">
            <p><strong>Height:</strong> ${pokemon.height}</p>
            <p><strong>Weight:</strong> ${pokemon.weight}</p>
            <p><strong>Types:</strong> ${pokemon.types.map((t) => t.type.name).join(", ")}</p>
        </div>
    `;
}

function renderAbilities(pokemon) {
    const abilitiesContainer = document.getElementById("abilities");
    abilitiesContainer.style.backgroundColor = colors.bg;
    abilitiesContainer.classList.add(
        `bg-[${colors.bg}]`,
        "rounded-md",
        "p-4",
        "w-full",
    );
    abilitiesContainer.innerHTML = `
        <h2 class="text-2xl font-bold mb-4">Abilities</h2>
        ${pokemon.abilities.map((a) => a.ability.name).join(", ")}
    `;
}

function renderStats(pokemon) {
    const statsContainer = document.getElementById("stats");
    statsContainer.style.backgroundColor = colors.bg;
    statsContainer.innerHTML = `
        <h2 class="text-2xl font-bold">Stats</h2>
        ${pokemon.stats
            .map(
                (s) => `
                    <div class="">
                        <p><strong>${s.stat.name}: </strong>${s.base_stat}</p>
                    </div>
                `,
            )
            .join("")}
    `;
}

async function fetchPokemon(id) {
    disableButtons();

    const res = await fetch(`https://pokeapi.co/api/v2/pokemon/${id}`);
    const pokemon = await res.json();

    console.log(pokemon, 'yusu');

    colors = typeColors[pokemon.types[0].type.name];

    renderSummary(pokemon);
    renderAbilities(pokemon);
    renderStats(pokemon);

    AOS.init({
        once: true,
    });
}
fetchPokemon(id);
