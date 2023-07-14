require "open-uri"

class GooglePlacesApi

    def self.find_place(element)
        google_client = GooglePlaces::Client.new(ENV['GOOGLE_API_KEY'])
        spot = google_client.predictions_by_input(element)
        if spot[0]
            spot_id = spot[0].place_id
            google_client.spot(spot_id)
        end
    end

    def self.location_images(location)
        place = set_location(location)
        if place
            photo_urls = place.photos[0..6].map { |photo| photo.fetch_url(1000) }
            location.attach_photos(photo_urls)
        end
    end

    def self.call(location)
        place = set_location(location)
        photo_urls = place.photos[0..6].map { |photo| photo.fetch_url(1000) }

        location = Location.create(
            city: place.city || place.region,
            country: place.country,
            state: place.region,
            latitude: place.lat,
            longitude: place.lng
        )
        location.attach_photos(photo_urls)
        location
    end

    def self.event_call(event)
        place = GooglePlacesApi.find_place(event.address)
        photo_urls = place.photos[0..3].map do |photo|
            photo.fetch_url(1000)
        end
        event.latitude = place.lat
        event.longitude = place.lng
        photo_urls.each_with_index do |photo_url, ind|
            file = URI.open(photo_url)
            event.photo.attach(io: file, filename: "#{event.city}-#{ind}.png", content_type: 'image/png')
        end
        event.save
        event
    end

    private

    def self.set_location(location)
        location = "#{location.city}, #{location.state}, #{location.country}" if location.class == Location
        event_place = GooglePlacesApi.find_place(location)
        place = find_place("#{event_place.city || event_place.region}, #{event_place.country}")
    end
end