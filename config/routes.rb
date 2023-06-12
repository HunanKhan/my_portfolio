Rails.application.routes.draw do
  resources :blogs
  resources :portfolios
  root to: "pages#home"
  get 'about-me' , to: "pages#about"
  get 'pages/contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
