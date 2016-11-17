class CreateFavourites < ActiveRecord::Migration[5.0]
  def change
    create_table :favourites do |t|
      t.references :user, foreign_key: true
      t.integer :group_id
      t.string :group_name
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
