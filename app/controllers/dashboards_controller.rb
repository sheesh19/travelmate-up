class DashboardsController < ApplicationController

    def show
        @user = current_user
        @events = @user.events
        @markers = @events.all_markers
        @past_events = @user.past_events
        @trips = @user.trips
        @all_events = @user.events
        @event_registrations = @user.event_registrations
        
        @fav_trips = @user.favorited_by_type('Trip')
        @fav_events = @user.favorited_by_type('Event')
        authorize @user
    end
end
