Rails.application.routes.draw do
  # get 'sessions/login,'
  # get 'sessions/home,'
  # get 'sessions/profile,'
  # get 'sessions/setting'
  get 'welcome/index'
  # resources :sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
  end
  
  
  resources :users
  
  root :to => "sessions#login"
match "signup", :to => "users#new"
match "login", :to => "sessions#login"
match "logout", :to => "sessions#logout"
match "home", :to => "sessions#home"
match "profile", :to => "sessions#profile"
match "setting", :to => "sessions#setting"
  root 'welcome#index' #map the root of the application to the welcome/index
end
