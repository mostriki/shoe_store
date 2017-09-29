class Store < ActiveRecord::Base
  has_many :assignments
  has_many :shoes, through: :assignments
end
