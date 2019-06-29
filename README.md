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

## Integrations

See [examples](https://github.com/hokaccha/simpacker/tree/master/example).

## Deployment

Simpacker does not provide feature for deployment. Just run the following command at deployment.

```
$ npm install
$ NODE_ENV=production ./node_modules/.bin/webpack
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hokaccha/simpacker.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
