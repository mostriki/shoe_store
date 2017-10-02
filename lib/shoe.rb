class Shoe < ActiveRecord::Base
  has_many :assignments
  has_many :stores, through: :assignments
# not connected to anything yet
  validates :brand, {:presence => true, :length => { :maximum => 100 }}
  validates :brand, uniqueness: { case_sensitive: false }
  before_save(:upcase_brand)
  # before_save(:price_to_decimal)

  private

  def upcase_brand
    self.brand = (brand.split.map(&:capitalize).join(' '))
  end

  # def price_to_decimal
  #   '%.02f' % price self.price
  # end
end
