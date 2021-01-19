const path = require("path");
const WebpackAssetsManifest = require("webpack-assets-manifest");

const { NODE_ENV } = process.env;
const isProd = NODE_ENV === "production";

module.exports = {
  mode: isProd ? "production" : "development",
  // devtool: "source-map",
  entry: {
    map: path.resolve(__dirname, "app/javascript/map.js"),
    calendar: path.resolve(__dirname, "app/javascript/calendar.js"),
  },
  output: {
    path: path.resolve(__dirname, "public/packs"),
    publicPath: "/packs/",
    filename: "[name]-[hash].js",
  },
  optimization: {
    splitChunks: {
      name: "vendor",
      chunks: "all",
      minSize: 0,
    },
    runtimeChunk: true,
  },
  resolve: {
    extensions: [".js"],
  },
  plugins: [new WebpackAssetsManifest({ publicPath: true, entrypoints: true })],
};
