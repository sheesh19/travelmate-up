export const initSidebar = () => {
    const sidebarBox = document.querySelector('.sidebar'),
        sidebarBtn = document.querySelector('#nav-button'),
        mainPage = document.querySelector('.main-content');

    sidebarBtn.addEventListener('click', event => {
        sidebarBtn.classList.toggle('active');
        sidebarBox.classList.toggle('active');
    });

    mainPage.addEventListener('click', event => {

        if (sidebarBox.classList.contains('active')) {
            sidebarBtn.classList.remove('active');
            sidebarBox.classList.remove('active');
        }
    });

    window.addEventListener('keydown', event => {

        if (sidebarBox.classList.contains('active') && event.keyCode === 27) {
            sidebarBtn.classList.remove('active');
            sidebarBox.classList.remove('active');
        }
    });
}