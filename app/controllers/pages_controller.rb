class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :kitchensink ]

  def home
    @trips = policy_scope(Trip)
    @events = policy_scope(Event)
    # @activities = Activity.all
    @locations = policy_scope(Location)
  end

  def kitchensink; end
end
