class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.date :date
      t.integer :price
      t.string :location
      t.string :title
      t.string :email
      t.string :image_url
      t.string :description

      t.timestamps null: false
    end
  end
end
