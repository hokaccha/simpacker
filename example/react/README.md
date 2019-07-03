# Simpacker react example

NOTE: This example explains the introduction of React using TypeScript. If you don't use TypeScript, you should use [Babel](https://github.com/hokaccha/simpacker/tree/master/example/babel) and [@babel/preset-react](https://babeljs.io/docs/en/babel-preset-react).

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

### app/javascript/packs/application.tsx

```typescript
import React from "react";
import ReactDOM from "react-dom";
import { Hello } from "./greeter";

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

Setup for React is now complete! Next section is for people who want to use styled-component additionally.

## styled-components

```
$ npm install --save styled-components
$ npm install --save-dev @types/styled-components
```

```diff
 // app/javascript/greeter.tsx
 import React, { FC } from "react";
+import styled from "styled-components";

 interface Props {
   name: string;
 }

+const Message = styled.div`
+  color: tomato;
+`;
+
 export const Hello: FC<Props> = ({ name }) => {
-  return <div>Hello {name}!</div>;
+  return <Message>Hello {name}!</Message>;
 };
```
