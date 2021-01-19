const path = require("path");
const WebpackAssetsManifest = require("webpack-assets-manifest");

const { NODE_ENV } = process.env;
const isProd = NODE_ENV === "production";

module.exports = {
  mode: isProd ? "production" : "development",
  devtool: "source-map",
  entry: {
    application: path.resolve(__dirname, "app/javascript/application.js"),
  },
  output: {
    path: path.resolve(__dirname, "public/packs"),
    publicPath: isProd
      ? "https://hokaccha.s3-ap-northeast-1.amazonaws.com/simpacker/asset-host/packs/"
      : "/packs/",
    filename: isProd ? "[name]-[hash].js" : "[name].js",
  },
  resolve: {
    extensions: [".js"],
  },
  module: {
    rules: [
      {
        test: /\.(png|jpg|gif|ttf|eot|woff|woff2|svg)$/,
        use: "file-loader",
      },
    ],
  },
  plugins: [new WebpackAssetsManifest({ publicPath: true })],
};
