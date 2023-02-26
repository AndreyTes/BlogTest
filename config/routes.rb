Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret',
                                                 confirmation: 'verification', unlock: 'unblock', registration: 'register',
                                                 sign_up: 'sign_up' }

  root to: 'posts#index', as: :root_path
  resources :users
  resources :posts do
    delete :delete_image, on: :member
  end
end
