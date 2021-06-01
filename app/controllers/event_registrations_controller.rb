class EventRegistrationsController < ApplicationController
    before_action :set_event_registration, only: [ :update, :destroy ]
    before_action :set_event, only: :create

    def index
        @chats = policy_scope(EventRegistration)
    end

    def create
        @event_registration = EventRegistration.new
        @event_registration.user = current_user
        @event_registration.event = @event
        @event_registration.status = 0
        
        if @event_registration.save
            # trigger email notification
            # mail = UserMailer.with(user: current_user, event: @event).event_mate_up error with heroku
            # mail.deliver_now error with heroku
        end
        authorize @event_registration
    end
    
    def update
        @event_registration.update(event_registration_params)
        authorize @event_registration
    end

    def destroy
        @event_registration.destroy
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
