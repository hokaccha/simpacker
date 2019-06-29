module Simpacker
  class Manifest
    class MissingEntryError < StandardError; end

    attr_reader :context

    def initialize(context)
      @context = context
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
      if context.config.cache_manifest?
        @data ||= load
      else
        load
      end
    end

    def load
      if context.config.manifest_path.exist?
        JSON.parse(context.config.manifest_path.read)
      else
        {}
      end
    end
  end
end
