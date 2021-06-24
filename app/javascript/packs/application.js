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
import "animate.css/source/animate.css";

// Cocoon
require("jquery")

// require("@nathanvda/cocoon")
import "@kollegorna/cocoon-vanilla-js";


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
// import { initAutoCompleteField } from '../components/init_algolia';
import { initFlatPickr } from '../plugins/init_date_picker';
import { initFileInput } from '../components/init_file_input';
import { initGoogleAutocomplete } from '../components/init_google_autocomplete';
import { initMapbox } from '../plugins/init_mapbox';
import { initStepperForm } from '../components/init_stepper_form';
import { initSidebar } from '../components/init_sidebar';
import { initSelect2 } from '../components/init_select2';
import { initCarousel } from "../components/init_carousel";
import { initEventRegistrationCable } from "../channels/event_registration_channel.js";
import { initAnimate } from "../plugins/init_animate";
import { initIso } from "../plugins/init_isotope";


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initAutoCompleteField();
  initFlatPickr();
  initFileInput();
  initGoogleAutocomplete();
  initMapbox();
  initStepperForm();
  initSidebar();
  initSelect2();
  initCarousel();
  initEventRegistrationCable();
  initAnimate();
  // initIso();

  // navigator.serviceWorker.register('/service_worker.js').then(registration => {
  //   console.log('ServiceWorker registered: ', registration);

  //   var serviceWorker;
  //   if (registration.installing) {
  //     serviceWorker = registration.installing;
  //     console.log('Service worker installing.');
  //   } else if (registration.waiting) {
  //     serviceWorker = registration.waiting;
  //     console.log('Service worker installed & waiting.');
  //   } else if (registration.active) {
  //     serviceWorker = registration.active;
  //     console.log('Service worker active.');
  //   }
  //   window.Notification.requestPermission().then(permission => {
  //     if (permission !== 'granted') {
  //       throw new Error('Permission not granted for Notification');
  //     }
  //   });
  // }).catch(registrationError => {
  //   console.log('Service worker registration failed: ', registrationError);
  // });
});
