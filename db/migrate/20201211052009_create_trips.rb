class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.integer :trip_type
      t.integer :visibility
      t.integer :status

      t.timestamps
    end
  end
end
