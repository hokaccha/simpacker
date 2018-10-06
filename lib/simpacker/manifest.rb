module Simpacker
  class Manifest
    class MissingEntryError < StandardError; end

    attr_reader :config

    def initialize(config)
      @config = config
    end

    def lookup(name)
      data[name.to_s].presence
    end

    def lookup!(name)
      lookup(name) || handle_missing_entry(name)
    end

    private

    def handle_missing_entry(name)
      raise Simpacker::Manifest::MissingEntryError
    end

    def data
      if config.cache_manifest?
        @data ||= load
      else
        load
      end
    end

    def load
      if config.manifest_path.exist?
        JSON.parse(config.manifest_path.read)
      else
        {}
      end
    end
  end
end
