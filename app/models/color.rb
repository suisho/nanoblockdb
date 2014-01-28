class Color < ActiveRecord::Base
  validates :name, :presence => true, format: { with: /[a-z _0-9]/ }, uniqueness: true
  validates :code, :presence => true, format: { with: /[0-9a-f]+/i }
  before_validation :code_to_lower_case

  def code_to_lower_case
    self.code = self.code.downcase
  end
end