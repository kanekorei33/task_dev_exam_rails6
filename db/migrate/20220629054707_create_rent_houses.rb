class CreateRentHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :rent_houses do |t|
      t.string :house_name
      t.string :rent
      t.string :address
      t.string :age
      t.text :remaks

      t.timestamps
    end
  end
end
