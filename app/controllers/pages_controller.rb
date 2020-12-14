class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :kitchensink ]

  def home
    @trips = Trip.all
    @events = Event.all
    # @activities = Activity.all
    @locations = Location.all
  end

  def kitchensink; end
end
