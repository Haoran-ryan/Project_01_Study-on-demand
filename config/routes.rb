Rails.application.routes.draw do
  get 'pages/home'
  root :to => "pages#home"

  resources :students
  resources :lecturers 
  resources :courses

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/login', to: 'session#destroy'

end
