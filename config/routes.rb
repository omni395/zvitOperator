Rails.application.routes.draw do

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
  
  scope :reports do
    get '/', to: 'reports#index', as: 'reports'
    get '/report_today', to: 'reports#report_today', as: 'report_today'
    get '/report_week', to: 'reports#report_week', as: 'report_week'
    get '/report_month', to: 'reports#report_month', as: 'report_month'
    get '/report_by_date', to: 'reports#report_by_date', as: 'report_by_date'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end