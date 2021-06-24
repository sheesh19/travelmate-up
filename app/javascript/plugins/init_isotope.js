var Isotope = require('isotope-layout');

const initIso = () => {
    const grid = document.querySelector('.js-grid');
    const jsBtns = document.querySelectorAll('.js-sort-btn');

    const sort = () => {
        const iso = new Isotope(grid, {
            // options
            itemSelector: '.js-grid-item',
            // layoutMode: 'fitRows',
            layoutMode: 'fitRows',
            fitRows: {
                gutter: 8
            },
            getSortData: {
                name: '.js-name'
            },
        });
    }

    if (jsBtns) {
        jsBtns.forEach((jsBtn) => {
            jsBtn.addEventListener('click', (e) => {
                e.preventDefault();
                sort();
            });
        });
    }
};

export { initIso };