class EventsController < ApplicationController

    def index
        @events = policy_scope(Event)
        event_markers_all
        # required for search
        unless params[:query].nil?
            @query = true
            @search_events = Event.event_search(params[:query])
        else
            @query = false
            @events = Event.all
        end
    end

    def show
        @event = Event.find(params[:id])
        authorize @event

        @markers = @event.markers
    end

    private

    def event_markers_all
        @markers = @all_events.map do |event|
            {
                lat: event.location.latitude,
                lng: event.location.longitude,
                #infoWindow: render_to_string(partial: "shared/infowindow", locals: { event: event.title })
            }
        end
    end
end
