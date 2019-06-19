# Simpacker

Yet another [webpacker](https://github.com/rails/webpacker).

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

Run the folloing command to build JavaScript and watch files.

```
$ npx webpack --watch
```

## Usage

You can use `javascript_pack_tag` in view.

```erb
<%= javascript_pack_tag 'application' %>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hokaccha/simpacker.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
