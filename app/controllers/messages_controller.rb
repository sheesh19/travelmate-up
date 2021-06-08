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
            redirect_to chat_path(@event_registration, anchor: "message-#{@message.id}")
        else
            render "chats/#{@event_registration.id}"
        end
        authorize @message
    end

    private

    def message_params
        params.require(:message).permit(:content)
    end
end
