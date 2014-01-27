class Shape < ActiveRecord::Base
  validates :model_name, uniqueness: true

  def short_side_dot_num
   read_attribute(:short_side_dot_num) || read_attribute(:short_side_size)
  end
  def long_side_dot_num
   read_attribute(:long_side_dot_num) || read_attribute(:long_side_size)
  end
end
