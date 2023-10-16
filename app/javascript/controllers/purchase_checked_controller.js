import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="purchase-checked"
export default class extends Controller {
  static values = {
    count: Number,
    url: String
  }
  static targets = ["url"]

  connect() {
    console.log("hello from the purchase checked controller");
    console.log(this.countValue);
    console.log(this.urlValues);
    console.log(this.urlTargets);
  }

  check(e) {
    console.log(this.urlTargets);
  }
}

// this.myCartTarget = setInterval(function() {
//   card.style.top = div.offsetBottom + 1 + "px"; },
//   100);
