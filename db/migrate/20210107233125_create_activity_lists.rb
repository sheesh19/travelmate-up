class CreateActivityLists < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_lists do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
