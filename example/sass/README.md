# Simpacker sass example

```
$ npm install --save-dev node-sass sass-loader css-loader mini-css-extract-plugin
```

## Edit webpack.config.js

```diff
 const path = require("path");
 const WebpackAssetsManifest = require("webpack-assets-manifest");
+const MiniCssExtractPlugin = require("mini-css-extract-plugin");

 const { NODE_ENV } = process.env;
 const isProd = NODE_ENV === "production";
@@ -27,8 +28,23 @@
         options: {
           transpileOnly: true
         }
+      },
+      {
+        test: loader: /\.scss$/,
+        use: [MiniCssExtractPlugin.loader, "css-loader", "sass-loader"]
       }
     ]
   },
-  plugins: [new WebpackAssetsManifest({ publicPath: true })]
+  plugins: [
+    new WebpackAssetsManifest({ publicPath: true }),
+    new MiniCssExtractPlugin({
+      filename: isProd ? "[name]-[hash].css" : "[name].css"
+    })
+  ]
 };
```

## Edit scripts

### app/javascript/application.ts

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
