class EventRegistration < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :user, uniqueness: { scope: :event, message: "You've already signed up!" }
  #                 0      1        2
  enum status: %i[Pending Approved Cancelled]

  def approve
    update(status: :approved)
  end

  private

  def cancel
    self.update(status: :cancelled)
  end
end
