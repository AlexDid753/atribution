class EventException < ActiveRecord::Base
  belongs_to :event
  validates :time, presence: true
end
