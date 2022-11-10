Rails.application.routes.draw do
  resources :developers
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "videogames#index"

  get "/videogames", to: "videogames#index"
  post "/videogames", to: "videogames#create"
  put "/videogames/:id", to: "videogames#update"
  delete "/videogames/:id", to: "videogames#destroy"

  get "/developers", to: "developers#index"
  post "/developers", to: "developers#create"
  put "/developers/:id", to: "developers#update"
  delete "/developers/:id", to: "developers#destroy"
end
