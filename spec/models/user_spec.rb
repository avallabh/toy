require 'spec_helper'

describe User do
  let(:blanks){ [nil, ''] }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }

  it { should have_valid(:email).when("person@example.com", "person1@yahoo.uk") }
  it { should_not have_valid(:email).when(*blanks, 'bob', 'nope@com', 'nah.com') }

  it { should have_many(:restrooms).through(:reviews)}
  it { should have_many(:reviews) }

  it 'has matching passwords' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'wrongpass'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
