document.getElementById('menu-btn').addEventListener('click', function () {
    const sidebar = document.getElementById('sidebar');
    sidebar.classList.remove('-translate-x-full');
});

document.addEventListener("click", function (event)  {
    const sidebar = document.getElementById('sidebar');
    if (!sidebar.contains(event.target) && !document.getElementById('menu-btn').contains(event.target)) {
        sidebar.classList.add('-translate-x-full');
    }
});