require "simpacker/context"
require "simpacker/configuration"
require "simpacker/manifest"
require "simpacker/helper"
require "simpacker/railtie"

module Simpacker
  def self.default_context
    @default_context ||= Simpacker::Context.new
  end
end
