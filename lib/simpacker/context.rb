require "yaml"

module Simpacker
  class Context
    class InvalidConfigurationError < StandardError; end

    attr_reader :config, :manifest

    def initialize(root_path: Rails.root, env: Rails.env)
      config = load_config_file(root_path, env)
      @config = Simpacker::Configuration.new(config)
      @manifest = Simpacker::Manifest.new(@config)
    end

    private

    def load_config_file(root_path, env)
      config_path = root_path.join("config/simpacker.yml")
      yaml = YAML.load(config_path.read)
      config_env = yaml.fetch(env.to_s)
      {
        manifest_path: root_path.join(config_env.fetch('manifest_path')),
        cache_manifest: config_env.fetch('cache_manifest'),
      }
    rescue Errno::ENOENT
      raise Simpacker::Context::InvalidConfigurationError, "Simpacker configuration file not found #{config_path}"
    rescue KeyError => err
      raise Simpacker::Context::InvalidConfigurationError, "Missing field: `#{err.key}` in #{config_path}"
    rescue Psych::SyntaxError => err
      raise Simpacker::Context::InvalidConfigurationError, "YAML syntax error occurred while parsing #{config_path}. Error: #{err.message}"
    end
  end
end
