# Simpacker asset-host example

To deliver assets from CDN or S3, you will set `config.action_controller.asset_host` in Rails configuration.

In Simpacker, this setting is used for `javascript_pack_tag` and` stylesheet_pack_tag`, but this setting is not used for URLs embedded in JavaScript or CSS using file-loader. In such cases, you need to set the `publicPath` of the webpack.

```diff
   },
   output: {
     path: path.resolve(__dirname, "public/packs"),
-    publicPath: "/packs/",
+    publicPath: isProd ? "https://cdn.example.com/packs/" : "/packs/",
     filename: isProd ? "[name]-[hash].js" : "[name].js"
   },
   resolve: {
@@ -26,6 +28,10 @@
         options: {
           transpileOnly: true
         }
+      },
+      {
+        test: /\.(png|jpg|gif|ttf|eot|woff|woff2|svg)$/,
+        use: "file-loader"
       }
     ]
   },
```
