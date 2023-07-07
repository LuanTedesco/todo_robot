Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  root to: redirect('/tasks')

  post '/fast_task', to: 'tasks#fast_task', as: 'fast_task'
end
