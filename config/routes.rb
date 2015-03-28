Rails.application.routes.draw do
  root 'dashboard#show'
  get '/home' => 'homepage#show', as: :home
  get '/signin' => 'sessions#new', as: :signin
  get '/signout' => 'sessions#destroy', as: :signout
  post '/signin' => 'sessions#create'
  get '/:task_id/complete' => 'tasks#complete', as: :complete_task

  resources :users do
    resources :tasks
  end
end
