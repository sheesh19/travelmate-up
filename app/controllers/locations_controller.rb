class LocationsController < ApplicationController
    before_action :set_location, only: [ :show ]

    def index
        @locations = policy_scope(Location).sort_by_events
        # @locations_sorted = @all_locations.sort_by_events
        # required for search
        unless params[:query].nil?
            @query = true
            sql_query = " \
            city ILIKE :query\
            OR country ILIKE :query\
            OR state ILIKE :query\
            "
            @locations = Location.where(sql_query, query: "%#{params[:query]}%")
            # @locations = Location.where('city ILIKE ?', "%#{params[:query]}%")
        else
            @query = false
            @locations = Location.all
        end
    end

    

    def show
        @markers = @location.markers
    end

    private

    def set_location
        @location = Location.find(params[:id])
        authorize @location
    end
end
