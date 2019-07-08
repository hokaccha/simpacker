puts "Copying config files"
copy_file "#{__dir__}/config/simpacker.yml", "config/simpacker.yml"
copy_file "#{__dir__}/root/webpack.config.js", "webpack.config.js"

unless File.exist?('package.json')
  copy_file "#{__dir__}/root/package.json", "package.json"
end

if Dir.exist?('app/javascript')
  say "The JavaScript app source directory already exists"
else
  say "Creating JavaScript app source directory"
  directory "#{__dir__}/javascript", 'app/javascript'
end

if File.exists?(".gitignore")
  append_to_file ".gitignore" do
    "\n/public/packs\n"
  end
end

dep_packages = %w(
  webpack
  webpack-cli
  webpack-assets-manifest
).join(' ')

say "Installing npm packages"
run "npm install --save-dev #{dep_packages}"

say "Simpacker successfully installed 🎉 🍰", :green
