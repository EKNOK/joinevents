Rails.application.routes.draw do
  get 'joins/create'

  get 'joins/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create, :update, :edit, :index]
  
  resources :events, only: [:index, :show, :new, :create, :destroy, :edit, :update]
  resources :joins, only: [:create, :destroy]
  
end