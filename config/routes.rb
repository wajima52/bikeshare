Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  resources :bicycles
  
  root 'pages#index'
  get 'pages/show'
  
  resources :pages, only: [:index, :show, :new, :create] do
    member do
      get :wantings
    end
  end
  
  resources :bicycles, only: [:index, :show, :new, :create] do
    member do
      get :applicants
    end
  end
  
  
  resources :relationships, only: [:create, :destroy]
end
