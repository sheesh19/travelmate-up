import flatpickr from "flatpickr";
import "flatpickr/dist/themes/material_green.css";

// Source: https://flatpickr.js.org/

const initFlatPickr = () => {
    const eventBtn = document.querySelector('.js-event-btn')
    const unvailableDates = JSON.parse(document.querySelector('.js-dates').dataset.unavailable)


    const flatpickrInputs = () => {
        flatpickr("input[type='date']", {
            enableTime: true,
            minDate: "today",
            defaultMinute: 0,
            defaultHour: 12,
            dateFormat: 'Z',
            altInput: true,
            altFormat: "j M Y, h:i K",
            disable: unvailableDates

        });

        flatpickr("input[type='datetime-local']", {
            enableTime: true,
            defaultMinute: 0,
            defaultHour: 12,
            minDate: "today",
            dateFormat: 'Z',
            altInput: true,
            altFormat: "j M Y, h:i K",
            disableMobile: true,
            disable: unvailableDates
        });
    };


    if (eventBtn) {
        eventBtn.addEventListener('click', (e) => {
            e.preventDefault();
            document.addEventListener('cocoon:after-insert', (e) => {
                flatpickrInputs();
            });
        });
    }

    flatpickrInputs();

};

export { initFlatPickr };
