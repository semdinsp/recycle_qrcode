// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import Sortable from "sortablejs"
import Rails from "@rails/ujs";


export default class extends Controller {
  static targets = [ "output" ]

  connect() {
    console.log('Hello, Stimulus. This is the drag controller!', this.element);
    this.sortable = Sortable.create(this.element, {
      group: 'shared',
      animation: 150,
      onEnd: this.end.bind(this)
    });
    console.log("Sortable created")
  }

  end(event) {
    console.log('Drag end event');
    let id = event.item.dataset.id
    let data = new FormData()
    data.append("position", event.newIndex + 1)
    data.append("rm", id)
    Rails.ajax({
      url: this.data.get("url"),
      type: 'PATCH',
      data: data
    })

  }
}
