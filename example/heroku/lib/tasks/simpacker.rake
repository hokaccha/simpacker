namespace :simpacker do
  task :compile do
    sh 'NODE_ENV=development yarn install' # To install devDependencies
    sh 'NODE_ENV=production yarn run webpack'
  end
end

Rake::Task["assets:precompile"].enhance do
  Rake::Task["simpacker:compile"].invoke
end
