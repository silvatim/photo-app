Rails.application.routes.draw do

  root "pages#home"
  get "/home" => "pages#home"
  get "/galleries" => "pages#galleries"
  get "/photos" => "pages#photos"

  get "/login" => "sessions#new", as: :login
  post "/login" => "sessions#create"
  delete "/login" => "sessions#destroy"

  get "/users/edit" => "users#edit", as: "edit_user"
  get "/tag/:tag" => "pages#photos", as: :tag
  resources :users, except: [:edit] do
    resources :galleries
    resources :photos
    member do
      get :following, :followers
     end
  end

  resources :relationships, only: [:create, :destroy]


end
