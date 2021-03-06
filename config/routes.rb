require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    namespace :admin do
      mount Sidekiq::Web => '/sidekiq'
      resources :users, only: [:index]
      resources :submissions, only: [:index]
      root to: "users#index"
    end
  end



  resources :communities do
    resource :subscriptions
  end

  get 'submissions/unsubscribe/:unsubscribe_hash' => 'submissions#unsubscribe', :as => 'comment_unsubscribe'

  get :search, controller: "application"

  resources :submissions do
    member do
      put "upvote", to: "submissions#upvote"
      put "downvote", to: "submissions#downvote"
    end
    resources :comments do # now I can access submissions/1/comments for example
      member do
        put "upvote", to: "comments#upvote"
        put "downvote", to: "comments#downvote"
      end
    end
  end

  devise_for :users
  # this will look for the "show" action in the users controller
  # in the frontend the url will be known as profile_path
  resources :users, only: [:show], as: 'profile'
  # get 'home/index'
  # root to: 'home#index'
  resources :premium
  root to: 'submissions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
