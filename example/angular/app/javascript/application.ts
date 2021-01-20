import "zone.js/dist/zone";
import { AppModule } from "./app.module";
import { platformBrowserDynamic } from "@angular/platform-browser-dynamic";

document.addEventListener("DOMContentLoaded", () => {
  platformBrowserDynamic().bootstrapModule(AppModule);
});
