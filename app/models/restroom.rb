class Restroom < ActiveRecord::Base

  validates_presence_of :location_name
  validates_presence_of :latitude
  validates_presence_of :longitude

  has_many :reviews,
    inverse_of: :restroom

  has_many :users, #, through: :reviews,
    inverse_of: :restroom

  def address
    [street_address, city, state, zip].compact.join(', ')
  end
end
