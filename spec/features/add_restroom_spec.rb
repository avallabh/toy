require 'spec_helper'

feature 'add a restroom', %Q{
  As an auth'd user
  I want to add a restroom
  So auth'd users can review it

  } do

# ACCEPTANCE CRITERIA
# * User is signed in
# * User clicks on the map to add a marker, then clicks Add Restroom
# * Coordinates are stored in a var and autopopulate the New Restroom form
# * User submits it

  scenario 'authenticated user adds a restroom' do
    visit root_path
    uri = URI.parse(current_url)
    fill_in "Location Name", with: "Dunkin Donuts"
    click_on "Add Restroom"
    "#{uri.path}".should == root_path
    expect(page).to_not have_content('Place a valid marker')
  end

end
