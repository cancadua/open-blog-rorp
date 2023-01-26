Rails.application.routes.draw do
  resources :posts, :except => [:show] do
    resources :comments, :except => [:edit, :show, :update]
  end
  get '/posts/tag/:tag', to: "posts#index", as: :tag
  get '/posts/search/:search', to: "posts#index", as: :search
  get 'home/index'
  root 'home#index'
end
