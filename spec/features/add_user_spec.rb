require 'spec_helper'

feature 'guest can register', %Q{
As a guest user
I want to create a free account
So I can add restaurants and reviews
} do

# ACCEPTANCE CRITERIA
# * If user is not logged in, display a sign-in / sign-up option
# * User provides required info: first/last name, password, retype password (must match password),
#   email, retype email (must match email)
# * If signed in, display sign-out option

  scenario 'user signs up' do
    password = "password"
    email = "person@example.com"

    visit restrooms_path
    click_on "Register"
    fill_in "First Name", with: "Joe"
    fill_in "Last Name", with: "Smith"
    fill_in "Password", with: password
    fill_in "Confirm Password", with: password
    fill_in "Email", with: email
    fill_in "Confirm Email", with: email
    click_on "Sign In"

    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')
    expect(page).to_not have_content('Register')
  end

  scenario 'user is registered but not logged in so they log in'
  scenario 'user is signed in so they log out'

end
