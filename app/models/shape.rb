class Shape < ActiveRecord::Base
  def short_side_dot_num
   read_attribute(:short_side_dot_num) || read_attribute(:short_side_size)
  end
  def long_side_dot_num
   read_attribute(:long_side_dot_num) || read_attribute(:long_side_size)
  end
end
