Rails.application.routes.draw do

  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
    namespace :admin do
     root 'admin#index'
     resources :users, only: [:index, :create, :destroy]
     resources :posts, only: [:index, :destroy]
     resources :comments, only: [:index, :destroy]
     resources :tags, only: [:index, :destroy]
    end
  resources :users do
    resources :bookmarks, only: [:create, :destroy, :index]
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :dislikes, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  get 'search', to: "static_pages#search"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
