Rails.application.routes.draw do

  resources :users, only: [:new, :create]

  resources :bands

  resources :albums, only: [:new, :create, :index, :show]

  resources :tracks, only: [:new, :create, :show] do
    resources :notes
  end

  resource :session, only: [:create, :destroy, :new]

  # get '/login' => 'session#new'
end
