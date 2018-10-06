install_template_path = File.expand_path("../install/template.rb", __dir__).freeze
bin_path = ENV["BUNDLE_BIN"] || "./bin"

namespace :simpacker do
  desc "Install Simpacker in this application"
  task :install do
    exec "#{RbConfig.ruby} #{bin_path}/rails app:template LOCATION=#{install_template_path}"
  end
end
