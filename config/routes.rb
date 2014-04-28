Rails.application.routes.draw do
  resources :assumptions

  resources :steps

  resources :groups

  resources :scenarios

  resources :projects

  devise_for :users
  devise_scope :user do
    get "/sign-in" => "devise/sessions#new"
  end

  root 'pages#home'
end
