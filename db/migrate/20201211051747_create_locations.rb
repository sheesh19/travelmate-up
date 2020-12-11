class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :country
      t.string :state
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
