class EventRegistrationsController < ApplicationController
    before_action :set_event_registration, only: :update

    def create
    end
    
    def update
        @event_registration.update(event_registration_params)
        authorize @event_registration
    end

  private

    def set_event_registration
        @event_registration = EventRegistration.find(params[:id])
    end

    def set_event
        @event = Event.find(params[:event_id])
    end

    def event_registration_params
        params.require(:event_registration).permit(:status)
    end
end
