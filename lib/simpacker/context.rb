module Simpacker
  class Context
    attr_reader :config, :manifest

    def initialize(root_path: Rails.root, env: Rails.env)
      config_path = root_path.join("config/simpacker.yml")
      data = load(config_path, env)
      @config = Simpacker::Configuration.new(
        manifest_path: root_path.join(data['manifest_path']),
        cache_manifest: data['cache_manifest'],
      )
      @manifest = Simpacker::Manifest.new(config)
    end

    private

    def load(config_path, env)
      YAML.load(config_path.read)[env.to_s]
    rescue Errno::ENOENT => e
      raise "Simpacker configuration file not found #{config_path}. " \
            "Please run rails simpacker:install " \
            "Error: #{e.message}"
    rescue Psych::SyntaxError => e
      raise "YAML syntax error occurred while parsing #{config_path}. " \
            "Please note that YAML must be consistently indented using spaces. Tabs are not allowed. " \
            "Error: #{e.message}"
    end
  end
end
