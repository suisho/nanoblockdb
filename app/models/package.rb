class Package < ActiveRecord::Base
  belongs_to :product
  has_many :package_contents
end