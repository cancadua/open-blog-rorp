Rails.application.routes.draw do
  resources :posts, :except => [:show] do
    resources :comments, :except => [:edit, :show, :update]
  end
  get 'home/index'
  root 'home#index'
end
