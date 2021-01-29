require "open-uri"

class PlacesImages
    def self.call(location)
        google_client = GooglePlaces::Client.new(ENV['GOOGLE_API_KEY'])
        
        place = google_client.spots(location.latitude, location.longitude)
        photo_url = place[0].photos[0].fetch_url(1000)
        file = URI.open(photo_url)
        location.photo.attach(io: file, filename: "#{location.city}.png", content_type: 'image/png')
        location.save
    end
end