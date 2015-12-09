class Lead < ActiveRecord::Base
  validates :name, :email, presence: true
end
