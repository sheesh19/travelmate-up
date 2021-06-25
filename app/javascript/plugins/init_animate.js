import 'turbolinks-animate'

const initAnimate = () => {
    const jsFadeElements = document.querySelectorAll('.js-fade')
    if (jsFadeElements) {
        jsFadeElements.forEach((jsFade) => {
            TurbolinksAnimate.init({ animation: 'fadeInUp', element: jsFade });
        });
    }
};

export { initAnimate };