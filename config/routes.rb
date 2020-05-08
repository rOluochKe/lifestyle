Rails.application.routes.draw do
  root 'articles#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  resources :users

  put '/users/:id', to:  'users#update_img'
  get '/saw_notification', to: 'users#saw_notification', as: 'saw_notice'

  resources :articles
  resources :votes
  resources :comments
  resources :categories
  # Custom route
  get 'category_articles', to: 'articles#category_articles'
end
