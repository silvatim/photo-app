Rails.application.routes.draw do

  root "pages#home"
  get "/home" => "pages#home"

  get "/login" => "sessions#new", as: :login
  post "/login" => "sessions#create"
  delete "/login" => "sessions#destroy"

  get "/users/edit" => "users#edit", as: "edit_user"
  resources :users, except: [:edit] do
    get "/followers" => "users#followers"
    get "/following" => "users#following"
  end


end
