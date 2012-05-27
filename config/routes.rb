Sportscape::Application.routes.draw do

  root :to =>'pages#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
