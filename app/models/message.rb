class Message < ApplicationRecord
  belongs_to :event_registration
  belongs_to :user
end
