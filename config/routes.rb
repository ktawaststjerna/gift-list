Rails.application.routes.draw do
  root to: "sessions#new"

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  put '/item_bought/:id' => "items#item_bought", as: :item_bought

  resources :items, only: %i[index show new create update edit destroy]
end
