# Simpacker React and Babel example

## Install packages

```
$ npm install --save react react-dom
$ npm install --save-dev babel-loader @babel/core @babel/preset-env @babel/preset-react
```

## Edit webpack config

```diff
   mode: isProd ? "production" : "development",
   devtool: "source-map",
   entry: {
-    application: path.resolve(__dirname, "app/javascript/application.js")
+    application: path.resolve(__dirname, "app/javascript/application.jsx")
   },
   output: {
     path: path.resolve(__dirname, "public/packs"),
@@ -16,7 +16,21 @@
     filename: isProd ? "[name]-[hash].js" : "[name].js"
   },
   resolve: {
-    extensions: [".js"]
+    extensions: [".js", ".jsx"]
+  },
+  module: {
+    rules: [
+      {
+        test: /\.jsx?$/,
+        exclude: /node_modules/,
+        use: {
+          loader: "babel-loader",
+          options: {
+            presets: ["@babel/preset-env", "@babel/preset-react"]
+          }
+        }
+      }
+    ]
   },
   plugins: [
 };
```

## Add files

### app/javascript/application.jsx

```javascript
import React from "react";
import ReactDOM from "react-dom";
import { Hello } from "./greeter";

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Hello name="Rails" />, document.getElementById("app"));
});
```

### app/javascript/greeter.jsx

```javascript
import React from "react";

export function Hello({ name }) {
  return <div>Hello {name}!</div>;
}
```
