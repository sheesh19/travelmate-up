class Event < ApplicationRecord
  belongs_to :location
  belongs_to :trip
  has_many :event_registrations, dependent: :destroy
  has_many :event_reviews, dependent: :destroy
  acts_as_taggable_on :tags, :activities
  has_many_attached :photos

  def self.upcoming
    Event.where("events.start_date > ?", Date.today)
  end

  # SIMPLE CALENDAR

  def start_time
    start_date
  end

  def end_time
    end_date
  end

  def markers
    [{
        lat: location.latitude,
        lng: location.longitude,
        # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
    }]
  end

  def self.build_events(trip, events_params)
    events_params.each do |event_param|
        event = Event.new(event_param[1].except(:location))
        location = Location.event_geocoder(event_param[1][:location])
        event.trip = trip
        event.location = location
        event.save!
    end
  end
end
