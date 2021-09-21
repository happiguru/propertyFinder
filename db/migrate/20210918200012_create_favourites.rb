class CreateFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|
      t.integer :house_id
      t.integer :user_id
    end
    add_foreign_key :favourites, :users, column: :user_id
    add_foreign_key :favourites, :houses, column: :house_id
  end
end
