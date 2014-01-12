class Review < ActiveRecord::Base

  validates_presence_of :user
  validates_presence_of :restroom

  belongs_to :restroom,
    inverse_of: :reviews

  belongs_to :user,
    inverse_of: :reviews
end
