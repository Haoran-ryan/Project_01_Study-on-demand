Rails.application.routes.draw do
  get 'pages/home'
  root :to => "pages#home"

  resources :students
  resources :lecturers 
end
