class Product < ActiveRecord::Base
  has_many :schedule_days
end
