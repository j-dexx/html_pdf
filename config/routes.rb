Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [] do
    resource :download, only: [:show]
  end
  root to: "users#index"
end
