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
  get "/search/:category" => "pages#photos", as: "category"
  resources :users, except: [:edit] do
    resources :galleries
    resources :photos
    member do
      get :following, :followers
     end
  end

  get "/galleries/:id/photos/new" => "photos#new", :as => "new_gallery_photo"
  post "/galleries/:id/photos" => "photos#create", :as => "gallery_photos"
  get "/search" => "pages#photos"
  post "/photos" => "photos#create"

  resources :relationships, only: [:create, :destroy]

end
