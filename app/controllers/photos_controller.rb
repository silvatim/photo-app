class PhotosController < ApplicationController
 before_action :set_user, only: [:index, :show, :edit, :update]
 before_action :set_photo, only: [:edit, :update, :destroy]

  def index
    @photos = @user.photos
  end

  def new
    @user = @current_user
    @gallery = Gallery.find_by :id => params[:id]
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if params[:file].present?
     req = Cloudinary::Uploader.upload(params[:file])
     @photo.image = req['public_id']
    end
    @photo.user = @current_user

	 if @photo.save
		 if params[:id]
			g = Gallery.find_by :id => params[:id]
			g.photos << @photo
			redirect_to user_gallery_path( @current_user.id, g.id )
		else
			redirect_to @current_user
		end
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
   if params[:file].present?
     req = Cloudinary::Uploader.upload(params[:file])
     @photo.image = req['public_id']
   end
    @photo.assign_attributes(photo_params)
    @photo.save
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
