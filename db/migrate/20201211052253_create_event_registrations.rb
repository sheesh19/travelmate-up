class CreateEventRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :event_registrations do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0, null:false

      t.timestamps
    end
  end
end
