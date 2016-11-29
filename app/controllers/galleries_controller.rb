class GalleriesController < ApplicationController
 before_action :set_user, only: [:index, :show, :create, :edit, :update]
 before_action :set_gallery, only: [:edit, :update, :destroy]

  def index
    @galleries = @user.galleries
  end

  def new
    @user = @current_user
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.user = @user
      if @gallery.save
        redirect_to user_galleries_path
      else
        render :new
      end
  end

  def show
    @gallery = @user.galleries.find(params[:id])
  end

  def edit
  end

  def update
    @gallery.update(gallery_params)
    redirect_to user_gallery_path(@user, @gallery)
  end

  def destroy
    @gallery.destroy
    redirect_to user_galleries_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_gallery
    @user = @current_user
    @gallery = @user.galleries.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:title, :description, :visibility, :user_id)
  end

end
