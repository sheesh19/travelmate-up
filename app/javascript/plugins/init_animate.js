import 'turbolinks-animate'

const initAnimate = () => {
    const jsFadeElements = document.querySelectorAll('.js-fade')
    if (jsFadeElements) {
        jsFadeElements.forEach((jsFade) => {
            TurbolinksAnimate.init({ animation: 'fadeinright', element: jsFade });
        });
    }
};

export { initAnimate };