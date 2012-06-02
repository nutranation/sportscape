Sportscape::Application.routes.draw do

  root :to =>'pages#index'
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/form',   :to => 'pages#form'
  match '/reg_redirect',   :to => 'pages#reg_redirect'
  match '/geo_grab',   :to => 'pages#geo_grab'
  resources :check_ins
  
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
