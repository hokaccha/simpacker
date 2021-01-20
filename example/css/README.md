# Simpacker sass example

## Install packages

```
$ npm install --save-dev css-loader mini-css-extract-plugin
```

## Edit webpack config

```diff
@@ -1,5 +1,6 @@
 const path = require("path");
 const WebpackAssetsManifest = require("webpack-assets-manifest");
+const MiniCssExtractPlugin = require("mini-css-extract-plugin");

 const { NODE_ENV } = process.env;
 const isProd = NODE_ENV === "production";
@@ -18,5 +19,18 @@
   resolve: {
     extensions: [".js"],
   },
+  module: {
+    rules: [
+      {
+        test: /\.css$/,
+        use: [MiniCssExtractPlugin.loader, "css-loader"],
+      },
+    ],
+  },
   plugins: [
     new WebpackAssetsManifest({
       publicPath: true,
       output: "manifest.json",
     }),
+    new MiniCssExtractPlugin({
+      filename: isProd ? "[name]-[hash].css" : "[name].css",
+    }),
   ],
 };
```

## Edit scripts

### app/javascript/application.js

```diff
 import { hello } from "./greeter";
+import "./application.css";
```

### app/javascript/application.css

```css
body {
  color: tomato;
}
```

### app/views/layouts/application.html.erb

```diff
+    <%= stylesheet_pack_tag 'application' %>
     <%= javascript_pack_tag 'application' %>
```
