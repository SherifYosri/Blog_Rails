require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  scope '/v1' do
    devise_for :users, skip: :all

    as :user do
      post 'users', to: 'v1/users#create'
      post 'sessions', to: 'v1/sessions#create'
    end

    resources :posts, controller: "v1/posts", only: [:create, :update, :destroy] do
    	resources :comments, controller: "v1/posts/comments", only: [:create, :update, :destroy]
      resource :tags, controller: "v1/posts/tags", only: [:update]
    end
  end
end
