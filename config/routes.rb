Rails.application.routes.draw do
  resources :dishes
  resources :meals
  root to: 'static#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
