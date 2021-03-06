Rails.application.routes.draw do
  
  
  
  root :to => "events#index"
  get 'home/secret'
  devise_for :users
  resources :users, only: [:show]
  resources :events
  resources :charges, only: [:new, :create]
  
  resources :events do
  	resources :attendances, only: [:new, :create]
  	resources :participations, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
