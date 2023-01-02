Rails.application.routes.draw do
  devise_for :users
  resources :tweets, except: [:edit,:update] do
    resources :comments, only: %i{create}
    member do
      post :retweet
    end
  end

  get 'home', to: "home#home"
  root "tweets#index"
  #root "home#home"
end
