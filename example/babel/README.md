# Simpacker APP_NAME example

## Install simpacker

See https://github.com/hokaccha/simpacker#installation

## Install packages

```
$ npm uninstall --save-dev ts-loader typescript
$ npm install --save-dev babel-loader @babel/core @babel/preset-env
```

## webpack.config.js

```diff
   mode: isProd ? "production" : "development",
   devtool: "source-map",
   entry: {
-    application: path.resolve(__dirname, "app/javascript/application.ts")
+    application: path.resolve(__dirname, "app/javascript/application.js")
   },
   output: {
     path: path.resolve(__dirname, "public/packs"),
@@ -16,15 +16,17 @@
     filename: isProd ? "[name]-[hash].js" : "[name].js"
   },
   resolve: {
-    extensions: [".js", ".ts"]
+    extensions: [".js"]
   },
   module: {
     rules: [
       {
-        test: /\.tsx?$/,
-        loader: "ts-loader",
-        options: {
-          transpileOnly: true
+        test: /\.m?js$/,
+        use: {
+          loader: "babel-loader",
+          options: {
+            presets: ["@babel/preset-env"]
+          }
         }
       }
     ]
```
