Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :users, only: %i[show]
  resources :photos, only: %i[create show new destroy]
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

  get 'search', to: "search#index"
  delete "users/:id", to: "users#destroy"
  root "follows#feed"

 end
