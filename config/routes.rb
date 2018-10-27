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
  
  resources :bicycles, only: [:index, :show, :new, :create] do
    member do
      get :demanders
    end
  end
  
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :demandings
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  resources :matchings, only: [:create, :destroy]
  resource :matchings, only: [:update]

  root to: 'bicycles#index'
  get 'search', to: 'bicycles#search'
end
