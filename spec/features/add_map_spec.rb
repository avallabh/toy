require 'spec_helper'

feature 'add map', %Q{
As a user
I want to see the map
So I can find/add a restroom
} do

# ACCEPTANCE CRITERIA
# * Display a map
# * Let user add a pin

  scenario 'display map' do
    visit restrooms_path
    expect(page).to have_content('Gotta Go')
  end

end
