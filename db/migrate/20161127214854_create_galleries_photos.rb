class CreateGalleriesPhotos < ActiveRecord::Migration
  def change
    create_table :galleries_photos, :id => false do |t|
      t.integer :gallery_id
      t.integer :photo_id
    end
  end
end
