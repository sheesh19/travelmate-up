class Trip < ApplicationRecord
  include Searchable
  include Markerable

  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :events, inverse_of: :trip, dependent: :destroy
  has_many :locations, through: :events
  accepts_nested_attributes_for :events, reject_if: :all_blank, allow_destroy: true

  acts_as_favoritable

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :title, :description ],
    associated_against: {
      events: [ :title, :description ],
      locations: [ :city, :state, :country ]
    },
    using: {
      tsearch: { prefix: true }
    }
  
  def total_time
    difference = self.end_date - self.start_date
    difference.to_i / 86400
  end

  def most_popular_trips
    #Itinerary.all.map{ |x| [FavoriteItinerary.where(itinerary_id: x.id).count, x] }.sort.reverse!
  end

end
