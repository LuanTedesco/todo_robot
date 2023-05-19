Rails.application.routes.draw do
  resources :tasks
  root to: redirect('/tasks')
end
