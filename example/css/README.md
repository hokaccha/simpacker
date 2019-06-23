# Simpacker css example

```
$ npm install --save-dev css-loader mini-css-extract-plugin
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
+        test: /\.css$/,
+        use: [
+          {
+            loader: MiniCssExtractPlugin.loader
+          },
+          "css-loader"
+        ]
       }
     ]
   },
-  plugins: [new WebpackAssetsManifest({ publicPath: true })]
+  plugins: [
+    new WebpackAssetsManifest({ publicPath: true }),
+    new MiniCssExtractPlugin({
+      filename: isProd ? "[name]-[hash].css" : "[name].css",
+      chunkFilename: "[id]-[chunkhash].css"
+    })
+  ]
 };
```

## Edit scripts

### app/javascript/application.ts

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

## Run

```
$ npx webpack
```

It works!
