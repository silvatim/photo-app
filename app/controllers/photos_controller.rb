class PhotosController < ApplicationController
 before_action :set_user, only: [:index, :show, :edit, :update]
 before_action :set_photo, only: [:edit, :update, :destroy]

  def index
    @photos = @user.photos
  end

  def new
    @user = @current_user
    @photo = Photo.new
    @gallery = Gallery.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = @current_user
      if @photo.save
        g = Gallery.find_by :id => params[:id]
        g.photos << @photo
        redirect_to user_gallery_path( @current_user.id, g.id )
      else
        render :new
      end
  end

  def show
    @photo = @user.photos.find(params[:id])
  end

  def edit
  end

  def update
    @photo.update(photo_params)
    redirect_to user_photo_path(@user, @photo)
  end

  def destroy
    @photo.destroy
    redirect_to user_photos_path(@current_user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_photo
    @photo = @current_user.photos.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :image, :description, :location, :user_id, :category_id, :tag_list)
  end
end
