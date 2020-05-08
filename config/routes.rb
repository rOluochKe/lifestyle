Rails.application.routes.draw do
  root 'articles#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  resources :users, only: %i[index show]

  put '/users/:id', to:  'users#update_img'
  get '/saw_notification', to: 'users#saw_notification', as: 'saw_notice'

  resources :articles, only: %i[index new create show destroy] do
    resources :votes, only: %i[create]
  end

  resources :comments, only: %i[new create destroy] do
    resources :votes, only: %i[create]
  end
  
  resources :categories, only: %i[new create destroy]

  # Custom route
  get 'category_articles', to: 'articles#category_articles'
end
