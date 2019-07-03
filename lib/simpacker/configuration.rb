module Simpacker
  class Configuration
    attr_accessor :manifest_path, :cache_manifest

    def initialize(manifest_path:, cache_manifest: true)
      @manifest_path = manifest_path
      @cache_manifest = cache_manifest
    end

    def cache_manifest?
      !!cache_manifest
    end
  end
end
