// app/javascript/controllers/alert_controller.js
import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

export default class extends Controller {

  connect() {
    $(this.element).delay(1000).fadeOut(1000);
  }
}
