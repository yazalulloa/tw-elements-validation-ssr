import {
  initTE,
  Carousel,
  Datepicker,
  Input,
  Ripple,
  Select,
  Sidenav,
  Timepicker,
  Validation,
} from "tw-elements";

import './loader.js';



import _hyperscript from 'hyperscript.org';

_hyperscript.browserInit();

window.initComponents = function () {
  console.log("INIT TW-ELEMENTS")
  initTE({
        Carousel,
        Datepicker,
        Input,
        Ripple,
        Select,
        Sidenav,
        Timepicker,
        Validation,
      },
      {allowReinits: true}, true); // set second parameter to true if you want to use a debugger
}


initComponents();

htmx.config.useTemplateFragments = true;