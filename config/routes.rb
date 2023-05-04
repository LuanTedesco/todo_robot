Rails.application.routes.draw do
  resources :tasks

  root to: redirect('/tasks')
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'today', to: 'today#index', as: :today
  get 'ended', to: 'ended#index', as: :ended
end
