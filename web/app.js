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
    link.href = "/assets/versions/test.png"; // Change this to your file path
    link.download = "filename.png";       // Optional: set custom filename
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
};
