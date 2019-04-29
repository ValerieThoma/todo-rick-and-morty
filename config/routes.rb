Rails.application.routes.draw do

  devise_for :users
  resources :items do
    member do
      patch :complete
    end
  end  
  
  resources :purchases
  
  root "items#index"
  
end
