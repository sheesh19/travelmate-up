class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :location, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :max_spots
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
