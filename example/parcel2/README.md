# Simpacker parcel2 example

## Install packages

```
$ npm install --save-dev parcel parcel-reporter-bundle-manifest
```

## Add files

### config/simpacker.yml

```yaml
default: &default
  manifest_path: public/packs/parcel-manifest.json

development:
  <<: *default
  cache_manifest: false

test:
  <<: *default
  cache_manifest: false

production:
  <<: *default
  cache_manifest: true
```

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

### app/javascript/index.html

```html
<script src="./application.js"></script>
```

## Run parcel

```
$ ./node_modules/.bin/parcel serve --dist-dir public/packs --public-url /packs app/javascript/index.html
```
