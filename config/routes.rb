Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/shelters', to: 'shelters#index'
  post '/shelters', to: 'shelters#create'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#read'
  patch '/shelters/:id', to: 'shelters#update'
  delete 'shelters/:id', to: 'shelters#destroy'
  get '/shelters/:id/edit', to: 'shelters#edit'
end
