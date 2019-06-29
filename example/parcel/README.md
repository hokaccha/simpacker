# Simpacker parcel example

## Install simpacker

See https://github.com/hokaccha/simpacker#installation

## Remove unused packages and files

```
$ npm uninstall --save-dev webpack webpack-cli  webpack-assets-manifest ts-loader
$ rm webpack.config.js
```

## Install packages

```
$ npm install --save-dev parcel-bundler parcel-plugin-bundle-manifest
```

## Edit config/simpacker.yml

```diff
@@ -1,5 +1,5 @@
 default: &default
-  manifest_path: public/packs/manifest.json
+  manifest_path: public/packs/parcel-manifest.json
```

Because [parcel-plugin-bundle-manifest](https://github.com/mugi-uno/parcel-plugin-bundle-manifest) outputs a manifest file to `parcel-manifest.json`;

## Update scripts

Convert TypeScript to JavaScript, because TypeScript does not work well with parcel 😭 The root cause is the same as [mugi-uno/parcel-plugin-bundle-manifest#23](https://github.com/mugi-uno/parcel-plugin-bundle-manifest/issues/23#issuecomment-504334592).

### app/javascript/application.js

```javascript
import { hello } from "./greeter";

document.addEventListener("DOMContentLoaded", () => {
  const el = document.getElementById("app");
  if (el) {
    el.textContent = hello("Rails");
  }
});
```

### app/javascript/greeter.js

```javascript
export function hello(name) {
  return `Hello ${name}!`;
}
```

## Run parcel

```
$ ./node_modules/.bin/parcel watch --out-dir public/packs --public-url /packs app/javascript/application.js
```
