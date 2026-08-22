Rails.application.routes.draw do
  get '/authors' => 'authors#index'
  get '/authors/:id' => 'authors#show'
  post '/authors' => 'authors#create'
  put '/authors/:id' => 'authors#update'
  delete '/authors/:id' => 'authors#delete'
  get '/books' => 'books#index'
  get '/books/:id' => 'books#show'
  post '/books' => 'books#create'
  put '/books/:id' => 'books#update'
  delete '/books/:id' => 'books#delete'
end
