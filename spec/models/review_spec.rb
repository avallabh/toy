require 'spec_helper'

describe Review do
  it { should validate_presence_of :user }
  it { should validate_presence_of :restroom }

  it { should belong_to(:user) }
  it { should belong_to(:restroom) }
end
