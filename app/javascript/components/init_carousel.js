import { tns } from 'tiny-slider/src/tiny-slider';

const initCarousel = () => {
    const jsCarousel = document.querySelector('.js-carousel')

    if (jsCarousel) {
        tns({
            container: jsCarousel,
            items: 3,
            mouseDrag: true,
            slideBy: 'page',
            swipeAngle: false,
            speed: 400,
            navPosition: 'bottom',
            nav: false,
            navContainer: false,
            controls: false,
            arrowKeys: false,
            navAsThumbnails: false,
            controlsContainer: false,
            edgePadding: 24,
            lazyload: true,
            responsive: {
                "300": {
                    items: 1
                },
                "1000": {
                    items: 3
                }
            }
        });
    }
}

export { initCarousel }