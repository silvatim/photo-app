class GalleriesController < ApplicationController

  def index
    @galleries = @current_user.galleries
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
      if @gallery.save
        redirect_to user_gallery_path
      else
        render :new
      end
  end

  def show
    @galleries = @current_user.galleries
  end

  def edit
    @gallery = @user.galleries.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
