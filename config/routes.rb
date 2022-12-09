Rails.application.routes.draw do
  devise_for :users
  resources :tweets, except: [:edit,:update]
  resources :users
  root "tweets#index"

end
