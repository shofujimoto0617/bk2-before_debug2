Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about'
  get 'search' => 'searches#search'
  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get :following, :followers
    end
  end
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
end