Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' } do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  
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
  resources :event_registrations, only: [ :update, :destroy ] do 
    resources :messages, only: :create
  end

  # CHATS
  resources :chats, only: [ :index, :show ]
  
  # LOCATIONS
  resources :locations, only: [ :index, :show ]

  # DASHBOARD
  resource :dashboards, only: :show

  # FAVOURITES
  resource :favorites, only: :update

  # ACTIVITIES
  resources :activities, only: [ :index, :show ]

  # PROFILE
  resource :profile, only: :show
  # resources :users, only: :show

  if Rails.env.development?
    get '/kitchensink', to: 'pages#kitchensink' if Rails.env.development?
  end
end
