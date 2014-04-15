require 'spec_helper'

feature 'add a restroom', %Q{
  As an auth'd user
  I want to add a restroom
  So auth'd users can review it

  } do

# ACCEPTANCE CRITERIA
# * User is signed in
# * User clicks on the map to add a marker, then fills out a location name
# * User clicks add restroom
# * Restroom added to database, marker displays on map

### JavaScript testing should be done with Selenium

  let(:user) { FactoryGirl.create(:user) }

  scenario 'authenticated user tries to add a restroom without adding a marker' do
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    within '.form-actions' do
      click_on "Sign In"
    end
    click_on "Add Restroom"

    expect(page).to have_content('Place a valid marker')
  end

  scenario 'unauthenticated user tries to add a restroom' do
    visit root_path
    # uri = URI.parse(current_url)
    click_on "Add Restroom"
    # "#{uri.path}".should == root_path

    expect(page).to have_content('You need to sign in or sign up before continuing')
  end

end
