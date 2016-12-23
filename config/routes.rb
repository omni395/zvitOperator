Rails.application.routes.draw do

  resources :materials
  root 'dashboard#index'

  devise_for :users, controllers: {:registrations => :registrations}
  resources :users, :only => ['index', 'show']

  resources :payments


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
