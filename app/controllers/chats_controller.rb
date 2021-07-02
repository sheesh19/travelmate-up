class ChatsController < ApplicationController

    def index
        @event_registrations = policy_scope(EventRegistration)
        @message = Message.new
        @chats = current_user.chat_mates
    end

    def show
        # CHATS
        @chats = current_user.chat_mates
        @chat = EventRegistration.find(params[:id])
        @message = Message.new

        # VIDEO
        opentok = OpenTok::OpenTok.new ENV['VONAGE_API_KEY'], ENV['VONAGE_API_SECRET']
        @token = opentok.generate_token @chat.vonage_session_id, { name: @chat.title }
        authorize @chat
    end
end
