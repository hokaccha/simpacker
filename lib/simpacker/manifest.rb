module Simpacker
  class Manifest
    class MissingEntryError < StandardError; end

    attr_reader :config

    def initialize(config)
      @config = config
    end

    def lookup(*names)
      data.dig(*names.map(&:to_s))
    end

    def lookup!(*names)
      lookup(*names) || handle_missing_entry(names)
    end

    private

    def handle_missing_entry(names)
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
      if config.manifest_path.exist? && config.manifest_path.file?
        JSON.parse(config.manifest_path.read)
      else
        {}
      end
    end
  end
end
