Rails.application.routes.draw do
 root 'dashboard#show'

  get '/home' => 'homepage#show', as: :home
end
