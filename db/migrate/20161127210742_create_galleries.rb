class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.text :description
      t.boolean :visibility
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
