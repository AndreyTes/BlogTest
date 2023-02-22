Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret',
                                                 confirmation: 'verification', unlock: 'unblock', registration: 'register',
                                                 sign_up: 'sign_up' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #root :to => redirect("/login")
  root to: 'posts#index', as: :root_path
  resources :users
  resources :posts
  #devise_scope :user do
  # root to: "devise/sessions#new"
  #end
end
