Rails.application.routes.draw do
  devise_for :users
  resources :tweets, except: %i[edit update] do
    resources :comments, only: %i{create}
    member do
      post :retweet
    end
  end
  resources :likes, only: %i[create destroy]
  
  get 'home', to: "home#home"
  root "tweets#index"
 end
