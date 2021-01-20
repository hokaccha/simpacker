# Simpacker TypeScript example

## Install packages

```
$ npm install --save-dev typescript ts-loader
```

## Edit webpack config

```diff
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
    "noImplicitThis": true
  }
}
```

### app/javascript/application.ts

```typescript
import { hello } from "./greeter";

document.addEventListener("DOMContentLoaded", () => {
  const el = document.getElementById("app");
  if (el) {
    el.textContent = hello("Rails");
  }
});
```

### app/javascript/greeter.ts

```typescript
export function hello(name: string): string {
  return `Hello ${name}!`;
}
```
