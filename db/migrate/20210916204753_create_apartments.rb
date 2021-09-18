class CreateApartments < ActiveRecord::Migration[6.1]
  def change
    create_table :apartments do |t|
      t.string :apartment_name
      t.string :city
      t.string :address
      t.text :description_short
      t.text :description_long
      t.string :price
      t.string :amenities_wifi
      t.string :amenities_parking
      t.string :amenities_kitchen
      t.string :amenities_iron
      t.string :amenities_microwave
      t.string :amenities_refridgerator

      t.timestamps
    end
  end
end
