Rails.application.routes.draw do
  
  root :to => "events#index"
  get 'home/secret'
  devise_for :users
  resources :users, only: [:show]
  resources :events, only: [:index, :new, :show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
