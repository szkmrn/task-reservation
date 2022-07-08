Rails.application.routes.draw do
  get 'users/account'
  get 'users/profile'
  devise_for :users
  root to: "homes#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/',to:'homes#home'
  
  resources :users
 
end
