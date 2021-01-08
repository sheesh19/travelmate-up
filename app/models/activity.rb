class Activity < ApplicationRecord
    has_many :activity_lists
    has_many :events, through: :activity_lists

    has_one_attached :photo
end
