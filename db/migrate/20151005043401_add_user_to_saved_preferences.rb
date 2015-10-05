class AddUserToSavedPreferences < ActiveRecord::Migration
  def change
# i initailly forgot to type this command in terminal
# rails g migration AddUserToSavedPreferences user:references
# this creates a foreign key so that the saved-preferences can refer to the user table.
# see http://stackoverflow.com/questions/22815009/add-a-reference-column-migration-in-rails-4 for details

    add_reference :saved_preferences, :user, index: true, foreign_key: true
  end
end
