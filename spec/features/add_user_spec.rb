require 'spec_helper'

## ENTIRE SPEC IS IDENTICAL TO add_map_spec
## NEEDS TO BE REWRITTEN FOR A USER
## AFTER I IMPLEMENT A USER VIA DEVISE
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
