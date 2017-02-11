Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'dashboard#index'

  devise_scope :user do
    get "/sign_up" => "devise/registrations#new", as: :new_user_registration
    get '/sign_in', to: 'devise/sessions#new', as: :new_user_session
    post '/sign_in', to: 'devise/sessions#create', as: :user_session
    delete '/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  devise_for :users, controllers: {:registrations => :registrations}, skip: [:sessions]
  resources :users, :only => ['index', 'show']

  resources :payments
  resources :materials
  resources :expences
  resources :articles
  
  
  get 'reports', to: 'reports#index'
  get 'report_by_date', to: 'reports#report_by_date'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end