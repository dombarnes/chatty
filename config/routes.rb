Chatty::Application.routes.draw do
  resources :rooms, path: 'r'
  resources :comments
  resources :rooms, path: 'r' do
    resource :comments, only: [:new, :create, :destroy]
  end

  root  'rooms#index'
  post 'search' => 'rooms#search'
  
end
