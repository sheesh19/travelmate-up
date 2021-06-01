Rails.application.routes.draw do
  devise_for :users
  
  # MAIN
  root to: 'pages#home'
  get 'explore', to: 'pages#explore'

  # TRIP 
  resources :trips do
    resources :events, only: [ :show, :new, :create, :update ]
  end

  # EVENTS
  resources :events, only: [ :index, :destroy, :update, :edit ] do 
    resources :event_registrations, only: [ :create ]
  end

  # EVENT REGISTRATIONS
  resources :event_registrations, only: [ :index, :update, :destroy ]
  
  # LOCATIONS
  resources :locations, only: [ :index, :show ]

  # DASHBOARD
  resource :dashboards, only: :show

  # FAVOURITES
  resource :favorites, only: :update

  # ACTIVITIES
  resources :activities, only: [ :index, :show ]

  # PROFILE
  resources :users, only: :show

  if Rails.env.development?
    get '/kitchensink', to: 'pages#kitchensink' if Rails.env.development?
  end
end
