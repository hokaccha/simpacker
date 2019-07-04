# Simpacker PostCSS example

## Install packages

```
$ npm install --save-dev css-loader mini-css-extract-plugin postcss-loader postcss-preset-env
```

## Edit webpack config

```diff
 const path = require("path");
 const WebpackAssetsManifest = require("webpack-assets-manifest");
+const MiniCssExtractPlugin = require("mini-css-extract-plugin");

 const { NODE_ENV } = process.env;
 const isProd = NODE_ENV === "production";
@@ -18,5 +19,27 @@
   resolve: {
     extensions: [".js"]
   },
-  plugins: [new WebpackAssetsManifest({ publicPath: true })]
+  module: {
+    rules: [
+      {
+        test: /\.css$/,
+        use: [
+          MiniCssExtractPlugin.loader,
+          "css-loader",
+          {
+            loader: "postcss-loader",
+            options: {
+              plugins: loader => [require("postcss-preset-env")()]
+            }
+          }
+        ]
+      }
+    ]
+  },
+  plugins: [
+    new WebpackAssetsManifest({ publicPath: true }),
+    new MiniCssExtractPlugin({
+      filename: isProd ? "[name]-[hash].css" : "[name].css"
+    })
+  ]
 };
```

## Edit files

### app/javascript/application.js

```diff
 import { hello } from "./greeter";
+import "./application.css";
```

### app/javascript/application.css

```css
:root {
  --mainColor: tomato;
}

body {
  color: var(--mainColor);
}
```

### app/views/layouts/application.html.erb

```diff
+    <%= stylesheet_pack_tag 'application' %>
     <%= javascript_pack_tag 'application' %>
```
