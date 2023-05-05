Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # verb "path", to: "name_controller#action"
  # delete "properties/:id", to: "properties#destroy"
  # patch "properties/:id", to: "properties#update"
  # get "properties/:id/edit", to: "properties#edit", as: :edit_property
  # post "properties", to: "properties#create"
  # get "properties/new", to: "properties#new", as: :new_property
  # get "properties/:id", to: "properties#show", as: :property
  # get "properties", to: "properties#index"
  resources :properties
end
