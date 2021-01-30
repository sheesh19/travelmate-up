import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
    const eventBtn = document.querySelector('.js-event-btn')

    const formatExample = (state) => {
        if (!state.id) {
            return state.text;
        }
        var $state = $(
            '<span></span>'
        );

        // Use .text() instead of HTML string concatenation to avoid script injection issues
        $state.find("span").text(state.text);

        return $state;
    };
    
    const select2Inputs = () => {
        $('.js-select2').select2({
            formatResult: formatExample,
            formatSelection: formatExample,
            allowClear: true,
            multiple: true
        });
    };


    if (eventBtn) {
        eventBtn.addEventListener('click', (e) => {
            e.preventDefault();
            document.addEventListener('cocoon:after-insert', (e) => {
                select2Inputs();
            });
        });
    }

    select2Inputs();

};

export { initSelect2 };