class GalleriesController < ApplicationController
 before_action :set_user, only: [:index, :show]
 before_action :set_gallery, only: [:edit, :update, :destroy]

  def index
    @galleries = @user.galleries
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
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
  end

  def destroy
    @gallery.destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_gallery
    @gallery = @current_user.galleries.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:title, :description, :visibility, :user_id)
  end

end
