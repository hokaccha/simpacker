# Simpacker sass example

## Install packages

```
$ npm install --save-dev node-sass sass-loader css-loader mini-css-extract-plugin
```

## Edit webpack config

```diff
 const path = require("path");
 const WebpackAssetsManifest = require("webpack-assets-manifest");
+const MiniCssExtractPlugin = require("mini-css-extract-plugin");

 const { NODE_ENV } = process.env;
 const isProd = NODE_ENV === "production";
@@ -18,5 +19,18 @@
   resolve: {
     extensions: [".js"]
   },
+  module: {
+    rules: [
+      {
+        test: /\.scss$/,
+        use: [MiniCssExtractPlugin.loader, "css-loader", "sass-loader"]
+      }
+    ]
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
+import "./application.scss";
```

### app/javascript/application.scss

```scss
$main-color: tomato;

body {
  color: $main-color;
}
```

### app/views/layouts/application.html.erb

```diff
+    <%= stylesheet_pack_tag 'application' %>
     <%= javascript_pack_tag 'application' %>
```
