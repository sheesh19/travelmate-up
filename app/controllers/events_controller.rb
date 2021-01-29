class EventsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index ]

    def index
        @events = policy_scope(Event)
        Event.all_markers
        # required for search
        unless params[:query].nil?
            @query = true
            @search_events = Event.search(params[:query])
        else
            @query = false
            @events = Event.all
        end
    end

    def show
        @event = Event.find(params[:id])
        authorize @event

        @markers = @event.single_marker
    end
end
