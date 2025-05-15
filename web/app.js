const year = document.getElementById("year");
year.innerHTML = new Date().getFullYear();

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