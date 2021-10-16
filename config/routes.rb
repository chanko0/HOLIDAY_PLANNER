Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :posts, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  get 'search' => 'searches#search'
end
