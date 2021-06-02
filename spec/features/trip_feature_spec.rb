require "rails_helper"

feature 'User visits trip page' do
    scenario "without logging in" do
        create(:activity)
        allow(Activity).to receive(:background_image).and_return('california.jpg')

        create(:trip)

        visit "/trips"

        expect(page).to have_text("FIND TRIP INSPIRATION")
    end
end