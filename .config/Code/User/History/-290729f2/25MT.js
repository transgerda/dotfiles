let nextUrl, prevUrl;
const resultsContainer = document.getElementById("results");
const prevBtn = document.getElementById("prevPage");
const nextBtn = document.getElementById("nextPage");

document.getElementById("nextPage").addEventListener("click", (e) => {
    if (!e.target.classList.contains("disabled")) fetchPokemon("next");
});
document.getElementById("prevPage").addEventListener("click", (e) => {
    if (!e.target.classList.contains("disabled")) fetchPokemon("prev");
});

document.querySelector("#search-input").addEventListener("keypress", (e) => {
    if (e.key === "Enter") document.getElementById("search-btn").click();
});

document.getElementById("search-btn").addEventListener("click", async (e) => {
    const url = "https://pokeapi.co/api/v2/pokemon?limit=9999";

    const res = await fetch(url);
    const data = await res.json();

    const q = document
        .getElementById("search-input")
        .value.trim()
        .toLowerCase();

    const pokemons = data.results
        .filter((pokemon) => pokemon.name.includes(q))
        .splice(0, 20);

    console.log(pokemons);

    showResults(pokemons);
});

function disableButtons() {
    const prev = document.getElementById("prevPage");
    prev.classList.toggle("cursor-not-allowed", prevUrl === null);
    prev.classList.toggle("opacity-80", prevUrl === null);
    prev.classList.toggle("disabled", prevUrl === null);

    const next = document.getElementById("nextPage");
    next.classList.toggle("cursor-not-allowed", nextUrl === null);
    next.classList.toggle("opacity-80", nextUrl === null);
    next.classList.toggle("disabled", nextUrl === null);
}

async function fetchPokemon(action = null) {
    let url = "https://pokeapi.co/api/v2/pokemon";

    if (action === "next" && nextUrl) {
        url = nextUrl;
    } else if (action === "prev" && prevUrl) {
        url = prevUrl;
    }

    const res = await fetch(url);
    const data = await res.json();

    nextUrl = data.next;
    prevUrl = data.previous;
    const pokemons = data.results;

    disableButtons();

    showResults(pokemons);
}

async function showResults(pokemons) {
    if (!pokemons.length) return;

    resultsContainer.innerHTML = "";

    for (const pokemon of pokemons) {
        const pokemonId = pokemon.url.split("/").reverse()[1];

        const pokemonElement = document.createElement("div");
        pokemonElement.classList.add(
            "flex",
            "flex-col",
            "items-center",
            "bg-gray-200",((a) => a.ability.name)
            "p-4",
            "rounded-lg",
            "cursor-pointer",
        );

        pokemonElement.innerHTML = `
            <img class="h-20" src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/${pokemonId}.gif" alt="${pokemon.name} image">
            <h3>${pokemonId}. ${pokemon.name}</h3>
        `;

        pokemonElement.addEventListener("click", () => {
            window.location.href = `detail.html?id=${pokemonId}`;
        });

        resultsContainer.appendChild(pokemonElement);
    }

    AOS.init({
        once: true,
    });
}
fetchPokemon();
