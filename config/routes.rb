Rails.application.routes.draw do
  root to: "sessions#new"

  #get 'sessions/new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  put '/item_bought/:id' => "items#item_bought", as: :item_bought

  resources :items
  resources :users
  resources :families
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
