Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :bands
  resource :session, only: [:create, :destroy, :new]

  # get '/login' => 'session#new'
end
