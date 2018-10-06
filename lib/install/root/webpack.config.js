const path = require("path");
const WebpackAssetsManifest = require("webpack-assets-manifest");

const { NODE_ENV } = process.env;

module.exports = {
  mode: NODE_ENV === "production" ? "production" : "development",
  devtool: "source-map",
  entry: {
    application: path.resolve(__dirname, "app/javascript/packs/application.ts")
  },
  output: {
    path: path.resolve(__dirname, "public/packs"),
    publicPath: "/packs/",
    filename: "[name]-[hash].js",
    chunkFilename: "[id]-[chunkhash].js"
  },
  resolve: {
    extensions: [".tsx", ".ts", ".js"]
  },
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        loader: "ts-loader",
        options: {
          transpileOnly: true
        }
      }
    ]
  },
  plugins: [new WebpackAssetsManifest({})]
};
