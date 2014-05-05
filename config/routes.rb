Rails.application.routes.draw do
  resources :comments

  resources :tasks

  resources :deployments

  resources :assumptions

  resources :steps

  resources :groups

  resources :scenarios

  resources :projects

  

  devise_for :users
  devise_scope :user do
    get "/sign-in" => "devise/sessions#new"
  end
  
  resources :users
  
  root 'pages#home'
end
