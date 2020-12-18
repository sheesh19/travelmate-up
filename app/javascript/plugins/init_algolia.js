import places from 'places.js';

export const initAutoCompleteField = (selector) => {
    const eventBtn = document.querySelector('.js-event-btn')


    if (eventBtn) {
        eventBtn.addEventListener('click', (e) => {
            e.preventDefault();
            console.log('yass');
            document.addEventListener('DOMContentLoaded', (e) => {
                var placesAutocomplete = places({
                    appId: process.env.ALGOLIA_APPLICATION_ID,
                    apiKey: process.env.ALGOLIA_APPlICATION_API_KEY,
                    container: document.querySelector('.js-trip-location')
                });
                placesAutocomplete.search();
                placesAutocomplete.on('change', e => console.log(e.suggestion));
            });
        });
    };
};
