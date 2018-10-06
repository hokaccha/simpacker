require "rails/railtie"

class Simpacker::Engine < ::Rails::Engine
  initializer "simpacker.helper" do
    ActiveSupport.on_load :action_controller do
      ActionController::Base.helper Simpacker::Helper
    end

    ActiveSupport.on_load :action_view do
      include Simpacker::Helper
    end
  end
end
