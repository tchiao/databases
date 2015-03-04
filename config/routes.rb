Rails.application.routes.draw do
  root 'books#index'
  get '/books' => 'books#index'
  resources :books
end
