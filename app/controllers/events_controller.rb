class EventsController < ApplicationController

    def index
        @all_events = policy_scope(Event)
        event_markers_all
        # add @event_favorite to index
        # @event_favorite = EventFavorite.find_by(event_id: params[:event_id], user_id: current_user)
        # required for search
        unless params[:query].nil?
            @query = true
            sql_query = " \
            events.title ILIKE :query \
            OR locations.city ILIKE :query \
            OR locations.country ILIKE :query\
            OR locations.state ILIKE :query\
            "
            @events = Event.joins(:location).where(sql_query, query: "%#{params[:query]}%")
            @all_events = Event.joins(:location).where.not(sql_query, query: "%#{params[:query]}%")
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
