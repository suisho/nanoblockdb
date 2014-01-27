class Product < ActiveRecord::Base
  validates :model_name, uniqueness: true
  validates :asin,       uniqueness: true
  has_many :packages
end
