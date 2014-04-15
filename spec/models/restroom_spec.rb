require 'spec_helper'

describe Restroom do
  it { should validate_presence_of :location_name }
  it { should validate_presence_of :latitude }
  it { should validate_presence_of :longitude }

  it { should have_valid(:location_name).when("Launch Academy") }
  it { should_not have_valid(:location_name).when(nil, '') }

  it { should have_many(:reviews).dependent(:destroy) }
  it { should have_many(:users).through(:reviews) }
end
