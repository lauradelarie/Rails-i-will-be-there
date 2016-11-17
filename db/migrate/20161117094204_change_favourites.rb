class ChangeFavourites < ActiveRecord::Migration[5.0]
  def change
    remove_column :favourites, :user, :integer
    add_reference :favourites, :users, index: true
    change_column_default :favourites, :active, from: false, to: true
  end
end
