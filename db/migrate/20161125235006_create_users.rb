class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :image
      t.text :password_digest
      t.text :about
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
