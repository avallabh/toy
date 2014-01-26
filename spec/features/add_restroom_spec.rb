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

  scenario 'authenticated user tries to add a restroom without adding a marker' do
    test = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: test.email
    fill_in 'Password', with: test.password
    within '.form-actions' do
      click_on "Sign In"
    end
    click_on "Add Restroom"
    expect(page).to have_content('Place a valid marker')
  end

  scenario 'regular user tries to add a restroom' do

    visit root_path
    uri = URI.parse(current_url)
    click_on "Add Restroom"
    "#{uri.path}".should == root_path
    expect(page).to have_content('You need to sign in or sign up before continuing')
  end

end
