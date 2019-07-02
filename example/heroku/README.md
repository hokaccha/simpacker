# Simpacker heroku example

## Add nodejs buildpack

```
$ heroku buildpacks:add --index 1 heroku/nodejs
Buildpack added. Next release on simpacker-example will use:
  1. heroku/nodejs
  2. heroku/ruby
```

## Add a task

Heroku executes `assets:precompile` task at deployment, so you have to add a task to execute webpack compilation after `assets:precompile`.

```ruby
# lib/tasks/simpacker.rake
namespace :simpacker do
  task :compile do
    sh 'NODE_ENV=development yarn install' # To install devDependencies
    sh 'NODE_ENV=production yarn run webpack'
  end
end

Rake::Task["assets:precompile"].enhance do
  Rake::Task["simpacker:compile"].invoke
end
```

If you disabled sprockets, `assets:precompile` is not defined, so you have to define `assets:precompile`.

```ruby
# lib/tasks/simpacker.rake
namespace :assets do
  task :precompile do
    sh 'NODE_ENV=production yarn run webpack'
  end
end
```
