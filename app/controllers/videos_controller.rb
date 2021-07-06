class VideosController < ApplicationController

    def show
        @chats = current_user.chat_mates
        @video = EventRegistration.find(params[:chat_id])

        # VIDEO
        opentok = OpenTok::OpenTok.new ENV['VONAGE_API_KEY'], ENV['VONAGE_API_SECRET']
        @token = opentok.generate_token @video.vonage_session_id, { name: @video.title }
        authorize @video
    end
end
