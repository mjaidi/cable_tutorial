Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  get 'conversations/index'
  devise_for :users
  root to: 'conversations#index'
  resources :conversations, only: [:create] do
    resources :messages, only: [:index, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
