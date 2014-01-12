require 'spec_helper'

feature 'add review to specific restroom', %Q{
As a user
I want to add a review for a restroom
So others can read my feedback
} do

# ACCEPTANCE CRITERIA
# * User must be signed in
# * Click a marker, click the link in InfoWindow
# * Goes to page for each restroom
# * Each restroom has 'Add Review' link
# * Reviews are stored per restroom
# * All reviews are listed when visiting a restroom

  scenario 'authenticated user adds a restroom' do
    # Not sure how to test based on JS actions
    # Skipping that part for now
    test = FactoryGirl.create(:restroom)

    visit "restrooms/#{test.id}"
    click_on "Add Review"
    select "5", from: "Cleanliness" # review_cleanliness
    select "5", from: "Privacy"
    select "5", from: "Smell"
    select "Unisex", from: "Gender"
    select "Public", from: "Accessibility"
    fill_in "Comments", with: "Here is text to fill in the box"
    click_button "Add Review"

    expect(page).to have_content('Review added!')
    expect(page).to_not have_content("can't be blank")
    expect(page).to_not have_content('Sign In')
  end

end
