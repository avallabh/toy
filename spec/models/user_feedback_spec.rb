require 'spec_helper'

describe UserFeedback do
  let(:blanks){ [nil, ''] }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :subject }
  it { should validate_presence_of :body }

  it { should have_valid(:email).when("person@example.com", "person1@yahoo.uk") }
  it { should_not have_valid(:email).when(*blanks, 'bob', 'nope@com', 'nah.com') }
end
