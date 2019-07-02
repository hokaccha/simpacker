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
- Languages
  - [TypeScript](https://github.com/hokaccha/simpacker/tree/master/example/typescript)
  - [Babel](https://github.com/hokaccha/simpacker/tree/master/example/babel)
  - [Sass](https://github.com/hokaccha/simpacker/tree/master/example/sass)
- Frameworks
  - [React](https://github.com/hokaccha/simpacker/tree/master/example/react)
  - [Vue.js](https://github.com/hokaccha/simpacker/tree/master/example/vue)
  - [Angular](https://github.com/hokaccha/simpacker/tree/master/example/angular)
- Deployment
  - [CDN](https://github.com/hokaccha/simpacker/tree/master/example/asset-host)
  - [Heroku](https://github.com/hokaccha/simpacker/tree/master/example/heroku)
  - [Docker](https://github.com/hokaccha/simpacker/tree/master/example/docker)
- Others
  - [Rails Engines](https://github.com/hokaccha/simpacker/tree/master/example/engines)
  - [Parcel](https://github.com/hokaccha/simpacker/tree/master/example/parcel)

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
