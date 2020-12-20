const initGoogleAutocomplete = () => {
    const eventBtn = document.querySelector('.js-event-btn')

    if (eventBtn) {
        eventBtn.addEventListener('click', (e) => {
            e.preventDefault();
            document.addEventListener('cocoon:after-insert', (e) => {

                function initializeAutocomplete(locationInput) {                    
                    if (locationInput) {
                        var autocomplete = new google.maps.places.Autocomplete(locationInput, {
                            // componentRestrictions: { country: "us" },
                        });
                        google.maps.event.addListener(
                            autocomplete,
                            "place_changed",
                            onPlaceChanged
                        );
                    }
                }

                function onPlaceChanged() {
                    var place = this.getPlace();

                    //console.log(place);  // Uncomment this line to view the full object returned by Google API.

                    for (var i in place.address_components) {
                        var component = place.address_components[i];
                        for (var j in component.types) {
                            // Some types are ["country", "political"]
                            var type_element = document.getElementById(component.types[j]);
                            if (type_element) {
                                type_element.value = component.long_name;
                            }
                        }
                    }
                }
                const locationInputs = document.querySelectorAll('.js-trip-location');
                locationInputs.forEach((locationInput) => {
                    initializeAutocomplete(locationInput);
                });

            });
        });
    }
}

export { initGoogleAutocomplete };
