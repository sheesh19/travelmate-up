class Event < ApplicationRecord
  belongs_to :location
  belongs_to :trip
  has_many :event_registrations, dependent: :destroy
  has_many :event_reviews, dependent: :destroy
  acts_as_taggable_on :tags, :activities
end
