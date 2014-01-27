class Color < ActiveRecord::Base
  validates :name, :precense => ture, format: { with: /[a-z _0-9]/ }
  validates :code, :precense => ture, format: { with: /[0-9a-f]+/i }
end