class Trip < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :events, inverse_of: :trip, dependent: :destroy
  accepts_nested_attributes_for :events, reject_if: :all_blank, allow_destroy: true

  acts_as_favoritable
  
  def total_time
    difference = self.end_date - self.start_date
    difference.to_i / 86400
  end

  def most_popular_trips
    #Itinerary.all.map{ |x| [FavoriteItinerary.where(itinerary_id: x.id).count, x] }.sort.reverse!
  end

  def markers
      # Markers for the itinerary map
      events.map do |event|
          {
              lat: event.location.latitude,
              lng: event.location.longitude,
              # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
              # infoWindow: render_to_string(partial: "shared/infowindow", locals: { event: event.title })
          }
      end
  end

end
