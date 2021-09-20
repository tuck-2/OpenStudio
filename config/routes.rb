Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :audios do
    resources :comments, only: [:create, :update, :destroy]
  end
end
