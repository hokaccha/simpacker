Rails.application.routes.draw do
  root 'root#index'

  get '/posts' => 'posts#index'
  get '/users' => 'users#index'
end
