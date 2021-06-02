require "rails_helper"

feature 'User visits trip page' do
    scenario "without logging in" do
        visit "/trips"

        expect(page).to have_text("FIND TRIP INSPIRATION")
    end
end