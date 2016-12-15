class User < ActiveRecord::Base
  has_secure_password
  has_many :event_attendees
  has_many :events, through: :event_attendees
  validates :first_name, :last_name, :email, :city, :state, presence:true
end
