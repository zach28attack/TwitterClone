Rails.application.routes.draw do
  resources :tweets, except: [:edit,:update]
  resources :users
  root "tweets#index"

end
