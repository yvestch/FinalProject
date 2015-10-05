class CreateSavedPreferences < ActiveRecord::Migration
  def change
    create_table :saved_preferences do |t|
      t.integer :price_min
      t.integer :price_max
      t.string :location
      t.string :keyword_srearch

      t.timestamps null: false
    end
  end
end
