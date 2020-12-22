Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rooms, path: 'r'
  resources :comments
  resources :rooms, path: 'r' do
    resource :comments, only: [:new, :create, :destroy]
  end

  root  'rooms#index'
  post 'search' => 'rooms#search'
end
