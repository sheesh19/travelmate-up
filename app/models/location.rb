class Location < ApplicationRecord
    include Imageable
    
    has_many_attached :photos
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
            location = GooglePlacesApi.call(location_name)
            return if location.nil?
            location
        end
    end

    def attach_photos(photo_urls)
        photo_urls.each do |photo_url|
            file = URI.open(photo_url)
            self.photos.attach(io: file, filename: "#{city}.png", content_type: 'image/png')
            self.save
        end
    end
end
