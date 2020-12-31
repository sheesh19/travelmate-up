Rails.application.routes.draw do
  devise_for :users
  
  # MAIN
  root to: 'pages#home'
  get 'explore', to: 'pages#explore'

  # TRIP 
  resources :trips do
    resources :events, except: [ :index, :destroy ]
  end

  # EVENTS
  resources :events, only: [ :index, :destroy ] do 
    resources :event_registrations, only: [ :create, :update ]
  end
  
  # LOCATIONS
  resources :locations, only: [ :index, :show ]

  # DASHBOARD
  resource :dashboards, only: :show

  if Rails.env.development?
    get '/kitchensink', to: 'pages#kitchensink' if Rails.env.development?
  end
end
