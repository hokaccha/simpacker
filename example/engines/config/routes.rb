Rails.application.routes.draw do
  root 'root#index'

  mount MyEngine::Engine => '/my_engine'
end
