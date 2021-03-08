Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :subs, only: [:new, :create, :edit, :update, :index, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :posts 
   
end
