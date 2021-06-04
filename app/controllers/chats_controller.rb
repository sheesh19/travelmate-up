class ChatsController < ApplicationController

    def index
        @chats = policy_scope(EventRegistration)
        @message = Message.new
    end

    def show
        @chats = policy_scope(EventRegistration)
        @chat = EventRegistration.find(params[:id])
        @message = Message.new
        authorize @chat
    end
end
