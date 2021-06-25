class LocationsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index, :show ]
    before_action :set_location, only: [ :show ]

    def index
        @pagy, @all_locations = pagy(policy_scope(Location), items: 12)
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

        respond_to do |format|
            format.html
            format.json {
                render json: { entries: render_to_string(partial: "locations", formats: [:html]), pagination: view_context.pagy_nav(@pagy) }
            }
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
