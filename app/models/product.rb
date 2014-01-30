class Product < ActiveRecord::Base
  validates :model_name, uniqueness: true, allow_nil: true
  validates :asin,       uniqueness: true
  has_many  :packages
end
