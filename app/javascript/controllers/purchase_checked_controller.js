import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="purchase-checked"
export default class extends Controller {
  static values = {
    count: Number
  }
  static targets = [purchase_array]
  for (let i = 0, len = this.countValue, text = "purchasing"; i = len; i++) {
    purchase_array = []
    purchase_array.push(text += i.toString())
  };

  connect() {
    console.log("hello from the purchase checked controller");
    console.log(this.countValue);
    // this.myCartTarget = setInterval(function() {
    //   card.style.top = div.offsetBottom + 1 + "px"; },
    //   100);
  }


  // buy(event) {

  // }
}
