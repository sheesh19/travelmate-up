const initGoogleAutocomplete = () => {
    const eventBtn = document.querySelector('.js-event-btn')

    if (eventBtn) {
        eventBtn.addEventListener('click', (e) => {
            e.preventDefault();
            document.addEventListener('cocoon:after-insert', (e) => {

                function initializeAutocomplete(selector) {
                    var element = document.querySelector(selector);
                    debugger
                    if (element) {
                        var autocomplete = new google.maps.places.Autocomplete(element, {
                            componentRestrictions: { country: "us" },
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

                initializeAutocomplete(".js-trip-location");
            });
        });
    }
}

export { initGoogleAutocomplete };
