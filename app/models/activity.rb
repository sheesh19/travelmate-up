class Activity < ApplicationRecord
    has_many :activity_lists
    has_many :events, through: :activity_lists

    has_one_attached :photo

    def self.most_popular_activities
        left_joins(:activity_lists).group(:id).order('COUNT(activity_lists.id) DESC').limit(12)
    end
end
