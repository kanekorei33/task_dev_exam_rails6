class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.string :route_name
      t.string :station_name
      t.string :on_foot
      t.references :rent_house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
