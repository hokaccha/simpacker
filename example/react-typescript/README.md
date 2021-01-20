# Simpacker React with TypeScript example

## Install packages

```
$ npm install --save react react-dom
$ npm install --save-dev typescript ts-loader @types/react @types/react-dom
```

## Edit webpack config

```diff
   entry: {
-    application: path.resolve(__dirname, "app/javascript/application.js")
+    application: path.resolve(__dirname, "app/javascript/application.tsx")
   },
   output: {
     path: path.resolve(__dirname, "public/packs"),
@@ -16,7 +16,18 @@
     filename: isProd ? "[name]-[hash].js" : "[name].js"
   },
   resolve: {
-    extensions: [".js"]
+    extensions: [".js", ".ts", ".jsx", ".tsx"]
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
   plugins: [
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
    "jsx": "react",
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
    "noImplicitThis": true
  }
}
```

### app/javascript/application.tsx

```typescript
import React from "react";
import ReactDOM from "react-dom";
import { Hello } from "./greeter";

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Hello name="Rails" />, document.getElementById("app"));
});
```

### app/javascript/greeter.tsx

```typescript
import React, { FC } from "react";

interface Props {
  name: string;
}

export const Hello: FC<Props> = ({ name }) => {
  return <div>Hello {name}!</div>;
};
```
