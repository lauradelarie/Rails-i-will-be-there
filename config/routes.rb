Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home'
  get 'member' => 'pages#member'
  # get '/get_groups' => 'pages#get_groups'
  get '/groups' => 'pages#groups'

  get '/get_group_events' => 'pages#get_group_events'

  resources :pages

  match "/auth/:provider/callback" => "sessions#create", via: [:get, :post]
  match "/signout" => "sessions#destroy", :as => :signout, via: [:get, :post]
end
