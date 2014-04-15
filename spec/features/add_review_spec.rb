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

  let(:user) { FactoryGirl.create(:user) }
  let(:test) { FactoryGirl.create(:restroom) }

  scenario 'authenticated user adds a review' do
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"

    visit "restrooms/#{test.id}"
    click_on "Add Review"
    select "5", from: "Cleanliness"
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


  scenario "user who is not signed in doesn't see Add Review" do
    visit "/restrooms/#{test.id}"

    expect(page).to_not have_content('Add Review')
  end

  scenario "user who is not signed in visits new review URL directly" do
    visit "/restrooms/#{test.id}/reviews/new"

    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
