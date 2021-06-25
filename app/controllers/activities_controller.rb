class ActivitiesController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index, :show ]

    def index
        @pagy, @activities = pagy(policy_scope(Activity), items: 15)

        respond_to do |format|
            format.html
            format.json {
                render json: { entries: render_to_string(partial: "activities", formats: [:html]), pagination: view_context.pagy_nav(@pagy) }
            }
        end
    end

    def show
        @activity = Activity.find(params[:id])
        authorize @activity
    end
end
