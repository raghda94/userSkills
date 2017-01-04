Rails.application.routes.draw do
  # devise_for :users
  resources :users
  post '/users/login' => 'users#login'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
