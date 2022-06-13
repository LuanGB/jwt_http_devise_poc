Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts
      post 'auth' => 'auth#create'
      delete 'auth' => 'auth#destroy'
    end
  end
  devise_for :users
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
