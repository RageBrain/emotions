Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  mount ActionCable.server => '/cable'
  resources :posts, only: [:index]
  resources :chat_rooms, only: [:new, :create, :show, :index]
end
