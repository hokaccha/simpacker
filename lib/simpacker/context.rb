module Simpacker
  class Context
    attr_reader :config, :manifest

    def initialize(root_path: Rails.root)
      @config = Simpacker::Configuration.new(root_path: root_path)
      @manifest = Simpacker::Manifest.new(self)
    end
  end
end
