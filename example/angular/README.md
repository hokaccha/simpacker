# Simpacker Angular example

## Install packages

```
$ npm install --save-dev typescript --ts-loader
$ npm install --save @angular/core @angular/common @angular/compiler @angular/platform-browser @angular/platform-browser-dynamic rxjs core-js zone.js
```

## Edit webpack config

```javascript
   mode: isProd ? "production" : "development",
   devtool: "source-map",
   entry: {
-    application: path.resolve(__dirname, "app/javascript/application.js")
+    application: path.resolve(__dirname, "app/javascript/application.ts")
   },
   output: {
     path: path.resolve(__dirname, "public/packs"),
@@ -16,7 +16,18 @@
     filename: isProd ? "[name]-[hash].js" : "[name].js"
   },
   resolve: {
-    extensions: [".js"]
+    extensions: [".js", ".ts"]
+  },
+  module: {
+    rules: [
+      {
+        test: /\.tsx?$/,
+        loader: "ts-loader",
+        options: {
+          transpileOnly: true
+        }
+      }
+    ]
   },
   plugins: [new WebpackAssetsManifest({ publicPath: true })]
 };
```

## Add files

### tsconfig.json

```json
{
  "compilerOptions": {
    "target": "es5",
    "lib": ["es2019", "dom", "dom.iterable"],
    "module": "es2015",
    "moduleResolution": "node",
    "esModuleInterop": true,
    "downlevelIteration": true,
    "sourceMap": true,
    "removeComments": false,
    "noImplicitAny": false,
    "strictNullChecks": true,
    "strictFunctionTypes": true,
    "strictBindCallApply": true,
    "strictPropertyInitialization": true,
    "noImplicitThis": true,
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true
  }
}
```

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
