// -----------------------------
// Get current year for footer
// -----------------------------

const year = document.getElementById("year");
year.innerHTML = new Date().getFullYear();

// ------------------------
// Navbar visibility Logic
// ------------------------

let lastScroll = 0;
const navbar = document.getElementById('navbar');
window.addEventListener('scroll', () => {
    const currentScroll = window.pageYOffset || document.documentElement.scrollTop;

    if (currentScroll > lastScroll && currentScroll > 70) {
        navbar.classList.add('hidden-navbar');
    } else {
        navbar.classList.remove('hidden-navbar');
    }
    lastScroll = currentScroll;
});

// ------------------------
// Download Version Logic
// ------------------------

function downloadFile() {
    const link = document.createElement("a");
    link.href = "assets/versions/bash-salt-0.5.0.zip"; // Change this to your file path
    link.download = "bash-salt-0.5.0.zip";       // Optional: set custom filename
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
};

// ------------------------
// fun fact generator logic
// ------------------------

const funFacts = [
    "Bash-salt is a play on words of 'Bassalt'; what I originally wanted to call this project",
    "This project was originally a way to quickly add my BASH commands to any computer I used",
    // "PHP is my second favourite language; I strongly dislike JavaScript. So this site is made with PHP"
];

function getRandomFunFact() {
    const randomIndex = Math.floor(Math.random() * funFacts.length);
    return funFacts[randomIndex];
}

const funFactElement = document.getElementById("fun-fact");
funFactElement.innerText = getRandomFunFact();

// ------------------------
// copy command logic
// ------------------------

function copyCommand() {
    const text = document
    .getElementById("bash-command")
    .innerText
    .trim();

    navigator.clipboard.writeText(text).then(() => {
    alert("Command copied to clipboard!");
    });
}
