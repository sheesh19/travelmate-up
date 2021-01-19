class Location < ApplicationRecord
    include Imageable
    
    has_one_attached :photo
    has_many :events

    geocoded_by :address
    # after_validation :geocode, if: :will_save_change_to_address?

    def address
        [city, state, country].compact.join(', ')
    end

    def self.sort_by_events
        # Top ten locations by number of events
        self
            .left_joins(:events)
            .group(:id)
            .order('COUNT(events.id) DESC')
            .limit(10)
    end

    def markers
        # marker for the location
        
        [{
            lat: latitude,
            lng: longitude,
            # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
        }]
    end

    def self.event_geocoder(location_name)
        if Location.find_by(city: location_name)
            Location.find_by(city: location_name)
        else
            r = Geocoder.search(location_name)
            return if r.empty?

            Location.create(
                city: location_name,
                country: r[0].data["address"]["country"],
                state: r[0].data["address"]["state"],
                latitude: r[0].data["lat"],
                longitude: r[0].data["lon"]
            )
        end
    end
end
