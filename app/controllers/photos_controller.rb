class PhotosController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @photos = @user.photos
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
      if @photo.save
        redirect_to user_photos_path
      else
        render :new
      end
  end

  def show
    @user = User.find(params[:user_id])
    @photo = @user.photos.find(params[:id])
  end


  def edit
    @user = @current_user
    @photo = @user.photos.find(params[:id])
  end

  def update
    @user = @current_user
    @photo = @user.photos.find(params[:id])

  end

  def destroy
    @user = @current_user
    @photo = @user.photos.find(params[:id])
    @photo.destroy
  end
end
