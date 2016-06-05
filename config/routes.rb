Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :categories

  resources :users, only: [:new, :create, :show] do
    resources :goals, only: [:new, :create, :index, :show]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
