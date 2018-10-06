require "yaml"

module Simpacker
  class Configuration
    attr_accessor :root_path, :config_path, :env

    def initialize
      @root_path = Rails.root
      @config_path = @root_path.join("config/simpacker.yml")
      @env = Rails.env
    end

    def manifest_path
      root_path.join(data.fetch("manifest_path"))
    end

    def cache_manifest?
      data.fetch("cache_manifest")
    end

    private

    def data
      @data ||= load
    end

    def load
      YAML.load(config_path.read)[env]
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
