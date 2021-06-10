class ChatsController < ApplicationController

    def index
        @event_registrations = policy_scope(EventRegistration)
        @message = Message.new
        @chats = current_user.chat_mates
    end

    def show
        @chats = current_user.chat_mates
        @chat = EventRegistration.find(params[:id])
        @message = Message.new
        authorize @chat
    end
end
