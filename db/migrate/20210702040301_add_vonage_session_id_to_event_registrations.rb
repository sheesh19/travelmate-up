class AddVonageSessionIdToEventRegistrations < ActiveRecord::Migration[6.0]
  def change
    add_column :event_registrations, :vonage_session_id, :string
  end
end
