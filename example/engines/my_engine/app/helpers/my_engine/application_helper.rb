module MyEngine
  module ApplicationHelper
    include Simpacker::Helper

    def simpacker_context
      MyEngine.simpacker_context
    end
  end
end
