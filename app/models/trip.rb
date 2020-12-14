class Trip < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :events, inverse_of: :trip, dependent: :destroy
  accepts_nested_attributes_for :events, reject_if: :all_blank, allow_destroy: true
end
