Rails.application.routes.draw do
  resources :priorities
  resources :tasks
  root to: redirect('/tasks')

end
