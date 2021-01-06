class TripsController < ApplicationController
    before_action :set_trip, only: [ :show, :update, :edit, :destroy ]
    
    def index
        @trips = policy_scope(Trip)

        # required for search
        unless params[:query].nil?
            @query = true
            @search_trips = Trip.search(params[:query])
        else
            @query = false
            @trips = Trip.all
        end
    end

    def show
        @user = @trip.user

        @markers = @trip.markers
    end

    def new
        @trip = Trip.new
        authorize @trip
        # render layout: 'application_without_sidebar'
    end

    def create
        @trip = Trip.new(trip_params)
        authorize @trip
        @trip.user = current_user
        
        if @trip.save
            Event.build_events(@trip, events_params)
            redirect_to trip_path(@trip)
        else
            render :new
        end
    end

    def edit; end
    
    def update
        @trip.update(trip_params)
    
        if @itinerary.save
            redirect_to itinerary_path(@itinerary)
        else
            render :edit
        end
    end

    def destroy
        @trip.destroy
    end

    private

    def set_trip
        @trip = Trip.find(params[:id])
        authorize @trip
    end

    def events_params
        params.require(:trip).permit(
            events_attributes: [
                :id, 
                :location, 
                :start_date, 
                :end_date, 
                :max_spots, 
                :description, 
                :title, 
                photos: [],
                tag_list: [],
                activity_list: []
            ]
        )[:events_attributes]
    end

    def trip_params
        params.require(:trip).permit(
            :user, 
            :title, 
            :start_date, 
            :end_date, 
            :status, 
            :description
        )
    end
end
