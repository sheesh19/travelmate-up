class Event < ApplicationRecord
  include Searchable
  include Markerable
  include Imageable

  belongs_to :location
  belongs_to :trip
  has_many :event_registrations, dependent: :destroy
  has_many :event_reviews, dependent: :destroy
  has_many :activity_lists, dependent: :destroy
  has_many :activities, through: :activity_lists

  acts_as_taggable_on :tags
  has_many_attached :photos

  acts_as_favoritable

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # after_create :update_images


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
    Event.where("events.start_date > ?", Date.today).order(:start_date)
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

  def self.build_event(trip, event_params)
    event = Event.new(event_params.except(:location))
    location = Location.event_geocoder(event_params[:location])
    event.trip = trip
    event.location = location
    event.address = event_params[:location]
    event.save!
    event.activities = Activity.build_activities(event_params[:activity_ids])
    event
  end

  def self.build_events(trip, events_params)
    events_params.each do |event_param|
        event = Event.new(event_param[1].except(:location))
        location = Location.event_geocoder(event_param[1][:location])
        event.trip = trip
        event.location = location
        event.address = event_param[1][:location]
        event.save!
        event.activities = Activity.build_activities(event_param[1][:activity_ids])
        event
    end
  end

  def update_event(event_params)
      update(event_params.except(:location))
      unless location == event_params[:location]
        new_location = Location.event_geocoder(event_params[:location])
        location = new_location
        address = event_params[:location]
      end
      self.save!
      self.activities = Activity.build_activities(event_params[:activity_ids])
      self
  end

  def update_images
    GooglePlacesApi.event_call(self)
  end
end
