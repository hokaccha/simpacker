# Simpacker Babel example

## Install packages

```
$ npm install --save-dev babel-loader @babel/core @babel/preset-env
```

## Edit webpack config

```diff
   resolve: {
     extensions: [".js"]
   },
+  module: {
+    rules: [
+      {
+        test: /\.m?js$/,
+        exclude: /node_modules/,
+        use: {
+          loader: "babel-loader",
+          options: {
+            presets: ["@babel/preset-env"]
+          }
+        }
+      }
+    ]
+  },
   plugins: [new WebpackAssetsManifest({ publicPath: true })]
 };
```
