class Event < ActiveRecord::Base
  belongs_to :host, class_name: 'User', foreign_key: 'user_id'
  has_many :event_attendees 
  has_many :users, through: :event_attendees
end
