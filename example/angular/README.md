# Simpacker APP_NAME example

## Install simpacker

See https://github.com/hokaccha/simpacker#installation

## Install packages

```
$ npm install --save @angular/core @angular/common @angular/compiler @angular/platform-browser @angular/platform-browser-dynamic rxjs core-js zone.js
```

## Edit files

### app/javascript/application.ts

```typescript
import "core-js/proposals/reflect-metadata";
import "zone.js/dist/zone";
import { AppModule } from "./app.module";
import { platformBrowserDynamic } from "@angular/platform-browser-dynamic";

document.addEventListener("DOMContentLoaded", () => {
  platformBrowserDynamic().bootstrapModule(AppModule);
});
```

###  app/javascript/app.module.ts

```typescript
import { BrowserModule } from "@angular/platform-browser";
import { NgModule } from "@angular/core";

import { AppComponent } from "./app.component";

@NgModule({
  declarations: [AppComponent],
  imports: [BrowserModule],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {}
```

### app/javascript/app.component.ts

```typescript
import { Component } from "@angular/core";

@Component({
  selector: "hello",
  template: `
    <div>Hello {{ name }}!</div>
  `
})
export class AppComponent {
  name = "Rails";
}
```

## Run

```
$ npx webpack
```

It works!
