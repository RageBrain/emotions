Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  mount ActionCable.server => '/cable'
  resources :posts
  resources :chat_rooms, only: [:new, :create, :show, :index]
  resources :images
  resources :statistics do
    get :reanalyze, on: :member
  end
  resources :users
  get :send_emotions, to: 'chat_rooms#send_emotions'
end
