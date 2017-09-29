class Shoe < ActiveRecord::Base
  has_many :assignments
  has_many :stores, through: :assignments
end
