require "rails_helper"

describe "trip" do
  it "requires a trip to belong to a user" do
    trip = Trip.new

    expect(trip).not_to be_valid
  end
end