class Color < ActiveRecord::Base
  validates :name, :presence => true, format: { with: /[a-z _0-9]/ }, uniqueness: true
  validates :code, :presence => true, format: { with: /[0-9a-f]+/i }
end