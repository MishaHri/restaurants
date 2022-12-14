Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #  resources :restaurant
  get "restaurants", to: "restaurants#index"
  post "restaurants", to: "restaurants#create"
  get "restaurants/new", to:"restaurants#new"
  get "restaurants/top", to: "restaurants#top", as: :top_resturants

  get "restaurants/:id/chef", to: "restaurants#chef", as: :chef_restaurant

  get "restaurants/:id", to: "restaurants#show", as: :restaurant

  get"restaurants/:id/edit", to: "restaurants#edit", as: :edit_resturant
  patch "restaurants/:id", to:"restaurants#update"

  delete "restaurants/:id", to: "restaurants#destroy"

  delete "restaurants", to: "restaurants#destroy_all"
end
