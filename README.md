# Simpacker

[![Build Status](https://travis-ci.org/hokaccha/simpacker.svg?branch=master)](https://travis-ci.org/hokaccha/simpacker) [![Gem Version](https://badge.fury.io/rb/simpacker.svg)](https://badge.fury.io/rb/simpacker)

Simpacker provides the feature to integrate modern JavaScript build system with Rails, like a [webpacker](https://github.com/rails/webpacker).

## Installation

Create a new rails application without webpacker.

```
$ rails new myapp
```

Add this line to your application's Gemfile:

```ruby
gem 'simpacker'
```

Run the following to install Simpacker:

```
$ rails simpacker:install
```

Add `javascript_pack_tag` in view.

```
<%= javascript_pack_tag 'application' %>
```

Run the folloing command to build JavaScript.

```
$ ./node_modules/.bin/wabpack --watch
```

## Examples

- Webpack settings
  - [webpack-dev-server](https://github.com/hokaccha/simpacker/tree/master/example/webpack-dev-server)
  - [Multiple Entry Point](https://github.com/hokaccha/simpacker/tree/master/example/multiple-entry-points)
- Transpilers
  - [TypeScript](https://github.com/hokaccha/simpacker/tree/master/example/typescript)
  - [Babel](https://github.com/hokaccha/simpacker/tree/master/example/babel)
- Style Sheets
  - [CSS](https://github.com/hokaccha/simpacker/tree/master/example/css)
  - [Sass](https://github.com/hokaccha/simpacker/tree/master/example/sass)
- Frameworks
  - [React](https://github.com/hokaccha/simpacker/tree/master/example/react)
  - [Vue.js](https://github.com/hokaccha/simpacker/tree/master/example/vue)
  - [Angular](https://github.com/hokaccha/simpacker/tree/master/example/angular)
- Deployment
  - [CDN](https://github.com/hokaccha/simpacker/tree/master/example/asset-host)
  - [Heroku](https://github.com/hokaccha/simpacker/tree/master/example/heroku)
  - [Docker](https://github.com/hokaccha/simpacker/tree/master/example/docker)
- Advanced settings
  - [Rails Engines](https://github.com/hokaccha/simpacker/tree/master/example/engines)
  - [Custom helper](https://github.com/hokaccha/simpacker/tree/master/example/custom-helper)
- Bundler
  - [Parcel](https://github.com/hokaccha/simpacker/tree/master/example/parcel)

## VS. Webpacker

Webpacker is a great product that you can easily use webpack without knowing it. It also provides many useful features. The difficulty with Webpacker is that you need to configure webpack via webpacker's own DSL and webpacker.yml. If you know how to configure webpack, you need to convert it to webpacker configuration. I want to edit webpack.config.js directly!

Simpacker provides only minimal features that lookup the manifest.json output by webpack and a create script tag through javascript_pack_tag. You need to know about webpack, but there is little to know about Simpacker.

However, some useful features of Webpacker, such as yarn integrity and compilation on request, are not available in Simpacker.

## Deployment

Simpacker does not provide feature for deployment. Just run the following command at deployment.

```
$ npm install
$ NODE_ENV=production ./node_modules/.bin/webpack
```

See also: [CDN](https://github.com/hokaccha/simpacker/tree/master/example/asset-host), [Heroku](https://github.com/hokaccha/simpacker/tree/master/example/heroku), [Docker](https://github.com/hokaccha/simpacker/tree/master/example/docker)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hokaccha/simpacker.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
