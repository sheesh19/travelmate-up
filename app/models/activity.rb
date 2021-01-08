class Activity < ApplicationRecord
    default_scope { order('title ASC') }
    
    has_many :activity_lists
    has_many :events, through: :activity_lists
    has_many :locations, through: :events

    has_one_attached :photo

    def self.most_popular_activities
        left_joins(:activity_lists).group(:id).order('COUNT(activity_lists.id) DESC')
    end

    def self.top_twelve_activities
        left_joins(:activity_lists).group(:id).order('COUNT(activity_lists.id) DESC').limit(12)
    end

    def activity_locations
        # Top ten activites by number of events
        #Activity.all.map{ |x| [Event.where(activity_id: x.id).count, x] }.sort.reverse!
    end
end
