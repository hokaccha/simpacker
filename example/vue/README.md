# Simpacker Vue example

## Install packages

```
$ npm install --save vue
$ npm install --save-dev vue-loader vue-template-compiler css-loader mini-css-extract-plugin
```

## Edit webpack config

```diff
 const path = require("path");
 const WebpackAssetsManifest = require("webpack-assets-manifest");
+const VueLoaderPlugin = require("vue-loader/lib/plugin");
+const MiniCssExtractPlugin = require("mini-css-extract-plugin");

 const { NODE_ENV } = process.env;
 const isProd = NODE_ENV === "production";
@@ -16,7 +18,28 @@
     filename: isProd ? "[name]-[hash].js" : "[name].js"
   },
   resolve: {
-    extensions: [".js"]
+    extensions: [".js", ".vue"],
+    alias: {
+      vue$: "vue/dist/vue.esm.js"
+    }
   },
-  plugins: [new WebpackAssetsManifest({ publicPath: true })]
+  module: {
+    rules: [
+      {
+        test: /\.vue$/,
+        loader: "vue-loader"
+      },
+      {
+        test: /\.css$/,
+        use: [MiniCssExtractPlugin.loader, "css-loader"]
+      }
+    ]
+  },
+  plugins: [
+    new VueLoaderPlugin(),
+    new WebpackAssetsManifest({ publicPath: true }),
+    new MiniCssExtractPlugin({
+      filename: isProd ? "[name]-[hash].css" : "[name].css"
+    })
+  ]
 };
 ```

## Add and change files

### app/javascript/Hello.vue

```html
<template>
  <div>Hello {{name}}!</div>
</template>

<script>
export default {
  props: ['name']
}
</script>

<style scoped>
div {
  color: tomato;
}
</style>
```

### app/javascript/application.js

```javascript
import Hello from "./Hello.vue";
import Vue from "vue";

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#app",
    template: `<hello name="Rails"></hello>`,
    components: { Hello }
  });
});
```

### app/views/layouts/application.html.erb

```diff
+    <%= stylesheet_pack_tag 'application' %>
     <%= javascript_pack_tag 'application' %>
```
