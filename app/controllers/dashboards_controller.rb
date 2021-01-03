class DashboardsController < ApplicationController

    def show
        @user = current_user
        @events = @user.events
        @fav_trips = @user.favorited_by_type('Trip')
        @fav_events = @user.favorited_by_type('Event')
        authorize @user
    end
end
