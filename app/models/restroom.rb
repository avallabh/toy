class Restroom < ActiveRecord::Base
  # geocoded_by :address
  # after_validation :geocode, :if => :address_changed?

  def address
    [street_address, city, state, zip].compact.join(', ')
  end
end
