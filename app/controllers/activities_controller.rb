class ActivitiesController < ApplicationController

    def index
        @activities = policy_scope(Activity)
    end

    def show
        @activity = Activity.find(params[:id])
        authorize @activity
    end
end
