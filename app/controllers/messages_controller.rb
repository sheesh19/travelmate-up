class MessagesController < ApplicationController

    def create
        @event_registration = EventRegistration.find(params[:event_registration_id])
        @message = Message.new(message_params)
        @message.event_registration = @event_registration
        @message.user = current_user
        
        if @message.save
            EventRegistrationChannel.broadcast_to(
              @event_registration,
              render_to_string(partial: "shared/chats/message", locals: { message: @message })
            )
            redirect_to event_registrations_path(active_tab: "#v-pills-chat-#{@event_registration.id}", anchor: "message-#{@message.id}")
        else
            render "event_registrations/index"
        end
        authorize @message
    end

    private

    def message_params
        params.require(:message).permit(:content)
    end
end
