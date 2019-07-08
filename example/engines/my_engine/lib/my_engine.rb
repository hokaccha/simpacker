require "my_engine/engine"

module MyEngine
  ROOT_PATH = Pathname.new(File.join(__dir__, ".."))

  def self.simpacker_context
    @simpacker_context ||= Simpacker::Context.new(root_path: ROOT_PATH)
  end
end
