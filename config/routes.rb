Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'home#index'
  resources :bills do 
    collection{
      post :add_item
    }
    resources :items
  end
  resources :companies
  
end
