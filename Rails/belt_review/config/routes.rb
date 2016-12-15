Rails.application.routes.draw do
  get 'session/index'

  get 'session/destroy'

  resources :user
  root 'user#index'
  post '/user' => 'user#create'
  get '/events' => 'event#index'
  post '/session/new' => 'session#login'
  post '/events/new' => 'event#create'
  get '/session/logout' => 'session#destroy'
  post '/event/:id/join' => 'event#join'
end
