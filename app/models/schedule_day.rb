class ScheduleDay < ActiveRecord::Base
  belongs_to :product

  has_many :schedule_events
end
