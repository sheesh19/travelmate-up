class EventRegistrationChannel < ApplicationCable::Channel
  def subscribed
    event_registration = EventRegistration.find(params[:id])
    stream_for event_registration
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
