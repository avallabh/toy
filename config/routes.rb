Toy::Application.routes.draw do
  devise_for :users
  # resources :restrooms, path: 'restrooms'
  resources :restrooms do
    resources :reviews
  end

  resources :user_feedback, path: 'feedback', as: 'user_feedbacks'

  root to: 'restrooms#index'
end
