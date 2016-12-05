class AddPhotoToFavourite < ActiveRecord::Migration[5.0]
  def change
    add_column :favourites, :photo_url, :string
  end
end
