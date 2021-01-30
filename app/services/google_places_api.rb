require "open-uri"

class GooglePlacesApi

    def self.find_place(element)
        google_client = GooglePlaces::Client.new(ENV['GOOGLE_API_KEY'])
        spot = google_client.predictions_by_input(element)
        spot_id = spot[0].place_id
        google_client.spot(spot_id)
    end

    def self.call(location)
        event_place = GooglePlacesApi.find_place(location)
        place = find_place("#{event_place.city || event_place.region}, #{event_place.country}")
        photo_url = place.photos[0].fetch_url(1000)

        location = Location.create(
            city: place.city || place.region,
            country: place.country,
            state: place.region,
            latitude: place.lat,
            longitude: place.lng
        )

        file = URI.open(photo_url)
        location.photo.attach(io: file, filename: "#{location.city}.png", content_type: 'image/png')
        location.save
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
end