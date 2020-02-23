Rails.application.routes.draw do
  devise_for :users

  root to: 'chat_rooms#index'

  resources :chat_rooms do
    get :private, on: :collection
    post :invite, on: :member
    resources :messages
  end
end
