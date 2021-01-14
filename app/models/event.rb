class Event < ApplicationRecord
  include Searchable
  include Markerable

  belongs_to :location
  belongs_to :trip
  has_many :event_registrations, dependent: :destroy
  has_many :event_reviews, dependent: :destroy
  has_many :activity_lists, dependent: :destroy
  has_many :activities, through: :activity_lists

  acts_as_taggable_on :tags, :activities
  has_many_attached :photos

  acts_as_favoritable

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :title, :description ],
    associated_against: {
      location: [ :city, :state, :country ]
    },
    using: {
      tsearch: { prefix: true }
    }

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

  def solo?
    max_spots == 0 || max_spots.nil?
  end
  
  def spots_left
    unless max_spots.nil?
      approved = event_registrations.where(status: 1).count
      # approved = EventRegistration.where(event_id: id) && EventRegistration.where(status: 1).count
      total = max_spots - approved
      total > 0 ? total || total : 0
    end
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
