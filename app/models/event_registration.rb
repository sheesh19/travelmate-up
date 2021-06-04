class EventRegistration < ApplicationRecord
  belongs_to :event
  belongs_to :user

  has_many :messages, dependent: :destroy

  validates :user, uniqueness: { scope: :event, message: "You've already signed up!" }
  #                 0      1        2
  enum status: %i[pending approved cancelled]

  def approve
    update(status: :approved)
  end

  def btn_opp_status    
    approved? ? "DECLINE" : "APPROVE"
  end

  def btn_opp_symbol    
    approved? ? :cancelled : :approved
  end

  def owner
    event.trip.user
  end

  def owner_name
    event.trip.user.first_name
  end

  def title
    event.title
  end

  private

  def cancel
    self.update(status: :cancelled)
  end
end
