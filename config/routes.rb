PhotoSharing::Application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users, :only => [:create, :new, :show, :destroy] do
    resources :posts, :only => [:new, :create, :edit, :update, :destroy]
  end
  resources :sessions, :only => [:create, :new, :destroy]
  resources :tags, :only => [:create, :destroy]


  root 'static_pages#index'
end
