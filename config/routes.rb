Rails.application.routes.draw do


  root "pages#home"
  get "/home" => "pages#home"
  get "/galleries" => "pages#galleries"
  get "/photos" => "pages#photos"

  get "/login" => "sessions#new", as: :login
  post "/login" => "sessions#create"
  delete "/login" => "sessions#destroy"

  get "/users/edit" => "users#edit", as: "edit_user"

  resources :users, except: [:edit] do
    get "/followers" => "users#followers"
    get "/following" => "users#following"
    resources :galleries
    resources :photos
  end


end
