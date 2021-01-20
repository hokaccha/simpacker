import { Component } from "@angular/core";

@Component({
  selector: "hello",
  template: "<div>Hello {{ name }}!</div>",
})
export class AppComponent {
  name = "Rails";
}
