module MyEngine
  class Engine < ::Rails::Engine
    isolate_namespace MyEngine
  end
end
