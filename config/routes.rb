Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :users, only: %i[index show]
  put '/users/:id', to:  'users#update_img'
  resources :articles, only: %i[index new create show destroy] do
    resources :votes, only: %i[create]
  end
  resources :comments, only: %i[new create destroy] do
    resources :votes, only: %i[create]
  end
end
