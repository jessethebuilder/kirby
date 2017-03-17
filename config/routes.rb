Rails.application.routes.draw do
  resources :posts do
    # member do
    #   get 'add_comment'
    # end
  end

  root to: 'posts#index'

  resources :comments

  devise_for :users
end
