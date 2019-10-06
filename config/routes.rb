Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'animals#index' 
  
  #resources :tasks #Uses built in Rails Routes, Missing Completed
  
  # Task Collection
  get '/animals', to: 'animals#index', as: 'animals'
  get '/animals/new', to: 'animals#new', as: 'new_animal'
  post '/animals', to: 'animals#create'
  
  # Individual Tasks
  get '/animals/:id', to: 'animals#show', as: 'animal'
  get '/animals/:id/edit', to: 'animals#edit', as: 'edit_animal'
  patch '/animals/:id', to: 'animals#update'
  delete '/animals/:id', to: 'animals#destroy'
end
