Rails.application.routes.draw do
  root 'dashboard#show'
  get '/home' => 'homepage#show', as: :home
  get '/signin' => 'sessions#new', as: :signin
  get '/signout' => 'sessions#destroy', as: :signout
  post '/signin' => 'sessions#create'
  post '/:task_id/complete' => 'tasks#complete', as: :complete_task
post '/:task_id/reopen' => 'tasks#reopen', as: :reopen
  resources :users do
    resources :tasks
  end
end
