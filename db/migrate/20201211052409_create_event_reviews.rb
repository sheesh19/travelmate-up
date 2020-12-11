class CreateEventReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :event_reviews do |t|
      t.references :event, null: false, foreign_key: true
      t.text :comments
      t.integer :rating, default: 0, null:false

      t.timestamps
    end
  end
end
