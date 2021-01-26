class ActivitiesController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index, :show ]

    def index
        @activities = policy_scope(Activity)
    end

    def show
        @activity = Activity.find(params[:id])
        authorize @activity
    end
end
