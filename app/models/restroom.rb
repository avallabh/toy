class Restroom < ActiveRecord::Base
  # geocoded_by :address
  # after_validation :geocode, :if => :address_changed?

  validates_presence_of :location_name
  validates_presence_of :latitude
  validates_presence_of :longitude

  def address
    [street_address, city, state, zip].compact.join(', ')
  end
end
