Rails.application.routes.draw do
  resources :communities

  resources :submissions do
    resources :comments # now I can access submissions/1/comments for example
  end

  devise_for :users
  # this will look for the "show" action in the users controller
  # in the frontend the url will be known as profile_path
  resources :users, only: [:show], as: 'profile'
  # get 'home/index'
  # root to: 'home#index'
  root to: 'submissions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
