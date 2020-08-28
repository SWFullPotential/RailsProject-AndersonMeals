Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'static#home'
  get 'meals/breakfast' => 'meals#breakfast'
  resources :meals do 
    resources :dishes, only: [:index, :new, :create]
  end
  resources :dishes

  post 'meals/:meal_id/dishes' => 'dishes#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
