class Activity < ApplicationRecord
    include Imageable

    default_scope { order('title ASC') }
    
    has_many :activity_lists, dependent: :destroy
    has_many :events, through: :activity_lists

    has_one_attached :photo

    def self.most_popular_activities
        joins(:activity_lists).group(:id).order('COUNT(activities.id) DESC') 
    end

    def self.top_twelve_activities
        left_joins(:activity_lists).group(:id).order('COUNT(activity_lists.id) DESC').limit(12)
    end

    def upcoming_events
        events.where('start_date >= ?', Date.today).order(start_date: :desc).limit(3)
    end

    def activity_locations
        Location.joins(events: :activity_lists).where(activity_lists: { activity_id: self.id })
        # Top ten activites by number of events
        #Activity.all.map{ |x| [Event.where(activity_id: x.id).count, x] }.sort.reverse!
    end
end
