# Simpacker webpack-dev-server example

## Install packages

```
$ npm install --save-dev webpack-dev-server
```

## Edit webpack config

```diff
   output: {
     path: path.resolve(__dirname, "public/packs"),
-    publicPath: "/packs/",
+    publicPath: isProd ? "/packs/" : "//localhost:8081/packs/",
     filename: isProd ? "[name]-[hash].js" : "[name].js"
   },
   resolve: {
     extensions: [".js"]
   },
-  plugins: [new WebpackAssetsManifest({ publicPath: true })]
+  devServer: {
+    contentBase: path.resolve(__dirname, "public"),
+    publicPath: "/packs/",
+    host: "localhost",
+    port: 8081,
+    headers: {
+      "Access-Control-Allow-Origin": "*"
+    }
+  },
+  plugins: [new WebpackAssetsManifest({ publicPath: true, writeToDisk: true })]
 };
```

## Run

```
$ ./node_modules/.bin/webpack-dev-server
```
