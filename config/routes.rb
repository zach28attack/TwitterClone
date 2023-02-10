Rails.application.routes.draw do
  devise_for :users
  get 'search', to: "search#index"
  resources :photos, only: %i[create show new destroy]
  resources :users, only: %i[show]
  resources :tweets, except: %i[edit update] do
    resources :comments, only: %i{create destroy}
    member do
      post :retweet
    end
  end
  resources :likes, only: %i[create destroy]
  resources :follows, only: %i[create destroy index] do 
    member do 
      get :following
      get :feed
    end
  end
  
  delete "users/:id", to: "users#destroy"
  get 'home', to: "home#home"
  root "tweets#index"

 end
