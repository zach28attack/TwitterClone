Rails.application.routes.draw do
  devise_for :users
  resources :tweets, except: [:edit,:update]
  resources :users
  get 'home', to: "home#home"
  root "tweets#index"
  #root "home#home"
end
