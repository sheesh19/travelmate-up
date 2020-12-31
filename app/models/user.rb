class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :trips
  has_many :events, through: :trips
  has_one_attached :avatar

  def num_listings
    events.count
    # events.map {|event| event.event_registrations.count}.reduce(&:+)
  end

  def age
    today = Date.today
    age = today.year - date_of_birth.year
    age -= 1 if date_of_birth.strftime("%m%d").to_i > today.strftime("%m%d").to_i
    age
  end
end
