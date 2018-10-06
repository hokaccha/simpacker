puts "Copying config files"
copy_file "#{__dir__}/config/simpacker.yml", "config/simpacker.yml"
copy_file "#{__dir__}/root/webpack.config.js", "webpack.config.js"
copy_file "#{__dir__}/root/tsconfig.json", "tsconfig.json"
copy_file "#{__dir__}/root/package.json", "package.json"

if Dir.exists?(Simpacker.config.source_path)
  say "The JavaScript app source directory already exists"
else
  say "Creating JavaScript app source directory"
  directory "#{__dir__}/javascript", Simpacker.config.source_path
end

if File.exists?(".gitignore")
  append_to_file ".gitignore", <<-EOS
/public/packs
/public/packs-test
/node_modules
yarn-debug.log*
.yarn-integrity
EOS
end

dep_packages = %w(
  webpack
  webpack-cli
  webpack-assets-manifest
  typescript
  ts-loader
).join(' ')

say "Installing dev server for live reloading"
run "yarn add --dev #{dep_packages}"

say "Simpacker successfully installed 🎉 🍰", :green
