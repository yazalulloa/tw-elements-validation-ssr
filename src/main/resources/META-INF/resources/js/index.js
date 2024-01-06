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
      {allowReinits: true}, true); // set second parameter to true if you want to use a debugger"

  console.log("TW-ELEMENTS INITIALIZED");
}

initComponents();

htmx.config.useTemplateFragments = true;


const validation1 = document.getElementById("validation-1");
const form1 = document.getElementById("form-1");
const input1 = document.getElementById("input-1");
let valid = true;

if (validation1) {
  console.log("VALIDATION 1")
  validation1.addEventListener("click", (e) => {
    e.preventDefault();
    input1.setAttribute(
        "data-te-validation-state",
        valid ? "valid" : "invalid"
    );
    form1.setAttribute("data-te-validated", true);
    valid = !valid;
  });
}
