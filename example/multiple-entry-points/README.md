# README

This example will explain how to automatically compile all files below `app/javascript/packs` as entry points, like Webpacker.

First, change the directory structure as follows:

```
app/javascript
├── packs
│   ├── posts.ts
│   └── users.ts
└── src
    └── greeter.ts
```

`posts.ts` and` users.ts` are compiled and called from another view.

```erb
<!-- app/views/posts/index.html.erb -->
<%= javascript_pack_tag 'posts' %>
```

```erb
<!-- app/views/users/index.html.erb -->
<%= javascript_pack_tag 'users' %>
```

## webpack.config.js

```
$ npm install --save-dev glob
```

```diff
 const path = require("path");
 const WebpackAssetsManifest = require("webpack-assets-manifest");
+const glob = require("glob");

 const { NODE_ENV } = process.env;
 const isProd = NODE_ENV === "production";

+const entries = {};
+glob.sync("app/javascript/packs/*.ts").forEach(filePath => {
+  const name = path.basename(filePath, path.extname(filePath));
+  entries[name] = path.resolve(__dirname, filePath);
+});
+
 module.exports = {
   mode: isProd ? "production" : "development",
   devtool: "source-map",
-  entry: {
-    application: path.resolve(__dirname, "app/javascript/application.ts")
-  },
+  entry: entries,
   output: {
     path: path.resolve(__dirname, "public/packs"),
     publicPath: "/packs/",
     filename: isProd ? "[name]-[hash].js" : "[name].js"
   },
   resolve: {
     extensions: [".js", ".ts"]
   },
```

## Use optimization.splitChunks

We recommend using [optimization.splitChunks] (https://webpack.js.org/plugins/split-chunks-plugin/) when using multiple endpoints.

For example, if you use jQuery in both `posts.ts` and` users.ts`, jQuery will be bundled in each file.

```typescript
// posts.ts
import $ from "jquery";
import { hello } from "../src/greeter";

$(() => {
  $("#app").text(hello("Posts"));
});
```

```typescript
// users.ts
import $ from "jquery";
import { hello } from "../src/greeter";

$(() => {
  $("#app").text(hello("Users"));
});
```

```
$ npx webpack
Hash: ccf04571a6ab564a29e1
Version: webpack 4.35.0
Time: 744ms
Built at: 06/24/2019 10:21:32 AM
        Asset       Size  Chunks             Chunk Names
manifest.json  150 bytes          [emitted]
     posts.js    279 KiB   posts  [emitted]  posts
     users.js    279 KiB   users  [emitted]  users
```

Both are 279 KiB.

To enable `splitChunks`, change as follows:

```diff
   output: {
     path: path.resolve(__dirname, "public/packs"),
     publicPath: "/packs/",
     filename: isProd ? "[name]-[hash].js" : "[name].js"
   },
+  optimization: {
+    splitChunks: {
+      name: "vendor",
+      chunks: "initial"
+    }
+  },
```

Then it becomes as follows.

```
$ npx webpack
Hash: 1bd5591c0c2e76ee3ed8
Version: webpack 4.35.0
Time: 704ms
Built at: 06/24/2019 10:32:38 AM
        Asset       Size  Chunks             Chunk Names
manifest.json  228 bytes          [emitted]
     posts.js   7.68 KiB   posts  [emitted]  posts
     users.js   7.68 KiB   users  [emitted]  users
    vendor.js    274 KiB  vendor  [emitted]  vendor
```

`posts.js` and` users.js` have been reduced to 7.68 KiB, and the common code has been split into `vendor.js`.

Finally, load `vendor.js` in layout.

```diff
+ <%= javascript_pack_tag 'vendor' %>
```
