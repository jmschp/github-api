// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

import fetch_git_hub_api from "./fetch_git_hub_api";
import { initTooltips } from "./init_bootstrap";
import selectUser from "./users_compare_selector";

document.addEventListener("turbolinks:load", () => {
  fetch_git_hub_api();
  initTooltips();
  selectUser();
});
