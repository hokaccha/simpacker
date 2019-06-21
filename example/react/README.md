# Simpacker: react example

## Install simpacker

See https://github.com/hokaccha/simpacker#installation

## Install react and react-dom

```
$ npm install --save react react-dom
$ npm install --save-dev @types/react @types/react-dom
```

## Change the `webpack.config.js`

```diff
-    application: path.resolve(__dirname, "app/javascript/packs/application.ts")
+    application: path.resolve(__dirname, "app/javascript/packs/application.tsx")
```

## Change the `tsconfig.json`

```diff
     "target": "es5",
     "lib": ["es2019", "dom", "dom.iterable"],
     "module": "es2015",
+    "jsx": "react",
     "moduleResolution": "node",
     "esModuleInterop": true,
     "downlevelIteration": true,
```

## Rename and change scripts

```
$ mv app/javascript/packs/application.{ts,tsx}
$ mv app/javascript/src/greeter.{ts,tsx}
```

### app/javascript/packs/application.tsx

```typescript
import React from "react";
import ReactDOM from "react-dom";
import { Hello } from "~/greeter";

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Hello name="Rails" />, document.getElementById("app"));
});

```

### app/javascript/src/greeter.tsx

```typescript
import React, { FC } from "react";

interface Props {
  name: string;
}

export const Hello: FC<Props> = ({ name }) => {
  return <div>Hello {name}!</div>;
};
```

## Run

```
$ npx webpack
```

It works!
