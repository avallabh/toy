require 'spec_helper'

feature 'contact email form', %Q{
  As an auth'd user
  I want to send email to owner
  So owner can get feedback

  } do

# ACCEPTANCE CRITERIA
# * User is signed in
# * User clicks feedback link
# * User supplies valid email, subject, descrip, first name, last name
#   --
# * The dispatched email should come from the visitor's email address
# * The dispatched email should include the visitor's first and last name
# * The dispatched email should content description information submitted

  scenario 'authenticated user sends feedback email' do
    ActionMailer::Base.deliveries = []

    visit '/feedback'
    fill_in "First Name", with: "John"
    fill_in "Last Name", with: "Smith"
    fill_in "Email", with: "johnsmith@gmail.com"
    fill_in "Subject", with: "JavaScript is broken"
    fill_in "Body", with: "The info windows for your markers do not display."

    expect(ActionMailer::Base.deliveries.size).to eql(1)
    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject(/JavaScript/)
    expect(last_email).to deliver_to('ajay.vallabh@gmail.com')
    expect(last_email).to have_body_text(/The info windows for your markers do not display./)
  end

end
