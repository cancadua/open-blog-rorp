Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  get 'home/index'
  get 'chat', to: 'chat#index'
  root 'home#index'
end
