Rails.application.routes.draw do
  root to: 'home#index'

  get '/demo', to: 'vehicles#index'
  resources :vehicles

  # Maps
  get '/map_demo', to: 'maps#index'
  get '/map_data', to: 'maps#map_data'

  get '/frames/get', to: 'frames#get'
  post '/frames/post', to: 'frames#post'
  resources :frames

  post 'streams/increment', to: 'streams#increment'
  post 'streams/decrement', to: 'streams#decrement'
  resources :streams
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  # Defines the root path route ("/")
  # root "posts#index"
end
