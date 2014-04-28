Rails.application.routes.draw do
  resources :projects

  devise_for :users
  devise_scope :user do
    get "/sign-in" => "devise/sessions#new"
  end

  root 'pages#home'
end