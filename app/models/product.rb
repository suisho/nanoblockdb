class Product < ActiveRecord::Base
  has_many :packages
end
