# Simpacker webpack-dev-server example

## Install simpacker

See https://github.com/hokaccha/simpacker#installation

## Install `webpack-dev-server`

```
$ npm install --save-dev webpack-dev-server
```

## Change the `webpack.config.js`

```diff
@@ -12,7 +12,7 @@
   },
   output: {
     path: path.resolve(__dirname, "public/packs"),
-    publicPath: "/packs/",
+    publicPath: isProd ? "/packs/" : "//localhost:8081/packs/",
     filename: isProd ? "[name]-[hash].js" : "[name].js"
   },
@@ -33,5 +33,11 @@
       }
     ]
   },
-  plugins: [new WebpackAssetsManifest({ publicPath: true })]
+  devServer: {
+    contentBase: path.resolve(__dirname, "public"),
+    publicPath: "/packs/",
+    host: "localhost",
+    port: 8081
+  },
+  plugins: [new WebpackAssetsManifest({ publicPath: true, writeToDisk: true })]
 };
```

## Run `webpack-dev-server`

```
$ ./node_modules/.bin/webpack-dev-server
```
