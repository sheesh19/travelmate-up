class EventsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index ]
    before_action :set_event, only: [ :show, :edit, :update ]
    before_action :set_trip, only: :create

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
        @markers = @event.single_marker
    end

    def new
        @trip = Trip.find(params[:trip_id])
        @event = Event.new
        authorize @event
    end
    
    def edit
        @trip = @event.trip
    end

    def create
        @event = Event.build_event(@trip, event_params)

        if @event.save
            redirect_to trip_event_path(@event.trip, @event)
        else
            render :edit
        end
    end

    def update
        @event.update_event(event_params)
            
        if @event.save
            redirect_to trip_event_path(@event.trip, @event)
        else
            render :edit
        end
    end
    
    private

    def set_event
        @event = Event.find(params[:id])
        authorize @event
    end

    def set_trip
        @trip = Trip.find(params[:trip_id])
        authorize @trip
    end

    def event_params
        params.require(:event).permit(
            :id, 
            :location, 
            :start_date, 
            :end_date, 
            :max_spots, 
            :description, 
            :title,
            :address,
            photos: [],
            tag_list: [],
            activity_ids: []
        )
    end
end
