class TripsController < ApplicationController
    before_action :set_trip, only: [ :show, :update, :edit, :destroy ]
    
    def index
        @trips = policy_scope(Trip)
    end

    def show
        @user = @trip.user

        trip_markers
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

        events_params.each do |event_param|
            event = Event.new(event_param[1].except(:location))
            location = Location.event_geocoder(event_param[1][:location])
            event.trip = @trip
            event.location = location
            event.save!
        end

        if @trip.save
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

    def trip_markers
        # Markers for the itinerary map
        @markers = @trip.events.map do |event|
            {
                lat: event.location.latitude,
                lng: event.location.longitude,
                # infoWindow: render_to_string(partial: "shared/infowindow", locals: { event: event.title })
            }
        end
    end

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
                :photo,
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
