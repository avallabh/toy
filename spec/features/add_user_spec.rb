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

    visit root_path
    click_link "Sign Up"
    fill_in "First Name", with: "Joe"
    fill_in "Last Name", with: "Smith"
    fill_in "Email", with: email
    # fill_in "Confirm Email", with: email
    fill_in "user_password", with: password
    fill_in "Password Confirmation", with: password
    click_button "Sign Up"

    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')
    expect(page).to_not have_content('Register')
  end

  scenario 'required information not supplied' do
    visit root_path
    click_link "Sign Up"
    click_button "Sign Up"

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'password confirmation' do
    email = "person@example.com"

    visit root_path
    click_link "Sign Up"
    fill_in "First Name", with: "Joe"
    fill_in "Last Name", with: "Smith"
    fill_in "Email", with: email
    # fill_in "Confirm Email", with: email
    fill_in "user_password", with: "password"
    fill_in "Password Confirmation", with: "theyDontMatch"
    click_button "Sign Up"

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
  end

end
