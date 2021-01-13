// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "controllers"

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";


// Cocoon
require("jquery")

// require("@nathanvda/cocoon")
import "@kollegorna/cocoon-vanilla-js";


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
// import { initAutoCompleteField } from '../components/init_algolia';
import { initGoogleAutocomplete } from '../components/init_google_autocomplete';
import { initMapbox } from '../plugins/init_mapbox';
import { initFlatPickr } from "../plugins/init_date_picker";
import "../components/init_stepper_form";

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initAutoCompleteField();
  initGoogleAutocomplete();
  initMapbox();
  initFlatPickr();
});
