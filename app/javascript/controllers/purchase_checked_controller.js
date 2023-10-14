import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="purchase-checked"
export default class extends Controller {
  static targets = ["purchasing"]

  connect() {
    console.log("hello from the purchase checked controller");
  }

  buy(event) {

  }
}
