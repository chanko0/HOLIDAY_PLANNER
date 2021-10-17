Rails.application.routes.draw do
  get 'users/show'
  root to: 'homes#top'
  devise_for :users
  resources :users do
   member do
    get :favorites
   end
  end
  resources :posts, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    get 'post' => 'posts#view'
  end
  get 'search' => 'searches#search'
  resources :users, only: [:show, :edit, :update]
end
