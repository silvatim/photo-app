class PagesController < ApplicationController

  def home
  end

  def galleries
   @all_galleries = Gallery.all
  end

  def photos
    @all_photos = Photo.all
  end

end
