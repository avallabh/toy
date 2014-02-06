class User < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name

  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

  has_many :reviews,
    inverse_of: :user

  has_many :restrooms, through: :reviews,
    inverse_of: :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
