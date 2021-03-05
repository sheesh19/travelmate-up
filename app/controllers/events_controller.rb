class EventsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index ]
    before_action :set_event, only: [ :show, :edit, :update ]

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
        @trip = Trip.find(params[:trip_id])
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
