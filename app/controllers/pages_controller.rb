class PagesController < ApplicationController

  def home
  end

  def galleries
   @all_galleries = Gallery.all
  end

  def photos
    if params[:tag]
      @all_photos = Photo.tagged_with(params[:tag])
    elsif params[:category]
      @all_photos = Photo.where(category_id: params[:category])
    else

      @all_photos = Photo.all
    end

  end


end
