# Simpacker vue example

## Install simpacker

See https://github.com/hokaccha/simpacker#installation

## Install packages

```
$ npm install --save vue
$ npm install --save-dev vue-loader vue-template-compiler css-loader mini-css-extract-plugin
```

## webpack.config.js

```diff
 const path = require("path");
 const WebpackAssetsManifest = require("webpack-assets-manifest");
+const VueLoaderPlugin = require("vue-loader/lib/plugin");
+const MiniCssExtractPlugin = require("mini-css-extract-plugin");

 const { NODE_ENV } = process.env;
 const isProd = NODE_ENV === "production";
@@ -16,7 +18,10 @@
     filename: isProd ? "[name]-[hash].js" : "[name].js"
   },
   resolve: {
-    extensions: [".js", ".ts"]
+    extensions: [".js", ".ts", ".vue"],
+    alias: {
+      vue$: "vue/dist/vue.esm.js"
+    }
   },
   module: {
     rules: [
@@ -26,8 +31,22 @@
         options: {
           transpileOnly: true
         }
+      },
+      {
+        test: /\.vue$/,
+        loader: "vue-loader"
+      },
+      {
+        test: /\.css$/,
+        use: [MiniCssExtractPlugin.loader, "css-loader"]
       }
     ]
   },
-  plugins: [new WebpackAssetsManifest({ publicPath: true })]
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

### types/vue-shim.d.ts

```typescript
declare module "*.vue" {
  import Vue from "vue";
  export default Vue;
}
```

### app/javascript/Hello.vue

```html
<template>
  <div>Hello {{name}}!</div>
</template>

<script lang="ts">
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

### app/javascript/application.ts

```typescript
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
