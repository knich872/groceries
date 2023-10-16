import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="purchase-checked"
let purchaseArray = [];
export default class extends Controller {
  static values = {
    count: Number,
    url: String
  }
  static targets = [""]

  connect() {
    console.log("hello from the purchase checked controller");
    console.log(this.countValue);
    // console.log(this.urlValues);
    // console.log(this.urlTargets);
  }


  check(e) {
    let url = e.target.baseURI + e.target.dataset.purchaseCheckedUrlValue
    console.log(url);
    if (purchaseArray.includes(url)) {
      purchaseArray = purchaseArray.filter(element => element !== url);
    } else {
      purchaseArray.push(url);
    }
    console.log(purchaseArray);
    return purchaseArray
  }

  purchase() {
    purchaseArray.forEach((url) => {
      fetch(url).then(response => response.json()).then(console.log(response));
    });
  }
}

// this.myCartTarget = setInterval(function() {
//   card.style.top = div.offsetBottom + 1 + "px"; },
//   100);
