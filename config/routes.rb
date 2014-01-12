Toy::Application.routes.draw do
  devise_for :users
  # resources :restrooms, path: 'restrooms'
  resources :restrooms do
    resources :reviews
  end

  root to: 'restrooms#index'
end
