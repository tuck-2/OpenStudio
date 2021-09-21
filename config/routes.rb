Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users, only: [:show]
  root to: 'homes#top'
  resources :audios do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :update, :destroy]
  end
end
