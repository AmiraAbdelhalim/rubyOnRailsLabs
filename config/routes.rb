Rails.application.routes.draw do
  devise_for :users
  # get 'sessions/login,'
  # get 'sessions/home,'
  # get 'sessions/profile,'
  # get 'sessions/setting'

  # get "signup", :to => "users#new"
  # post "users", :to => "users#create"
  # get "login", :to => "sessions#login"
  # post "login", :to => "sessions#login_attempt"
  # get "logout", :to => "sessions#logout"

  get 'welcome/index'
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
  end
  
  
  # resources :users
 

  root 'welcome#index' #map the root of the application to the welcome/index
end
