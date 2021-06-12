import Shuffle from 'shufflejs';

const initShuffle = new Shuffle(document.querySelector('.js-shufflegrid'), {
    itemSelector: '.js-shuffle-card',
    sizer: '.js-shuffle-sizer',
});

export { initShuffle };