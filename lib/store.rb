class Store < ActiveRecord::Base
  has_many :assignments
  has_many :shoes, through: :assignments
  validates :name, {:presence => true, :length => { :maximum => 100 }}
  validates :name, uniqueness: { case_sensitive: false }
  before_save(:upcase_name)

  private

  def upcase_name
    self.name=(name().split.map(&:capitalize).join(' '))
  end
end
