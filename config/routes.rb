Rails.application.routes.draw do
  devise_for :users
  resources :sub_tasks
  resources :tags
  resources :tasks do
    resources :sub_tasks, only: %i[create]
  end
  root to: redirect('/tasks')
  post '/fast_task', to: 'tasks#fast_task', as: 'fast_task'
end
