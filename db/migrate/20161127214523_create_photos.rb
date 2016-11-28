class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.text :location
      t.integer :category_id
      t.text :image
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
