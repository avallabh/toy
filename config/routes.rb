Toy::Application.routes.draw do
  devise_for :users
  resources :restrooms, path: 'restrooms'
end
