Rails.application.routes.draw do
  root to: 'sessions#new'

  namespace :admin do
    resources :categories
    resources :users, only: [:index, :show]
  end

  resources :users, only: [:new, :create, :show] do
    resources :goals
    resources :scheduled_goals
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
