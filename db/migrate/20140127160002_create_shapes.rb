class CreateShapes < ActiveRecord::Migration
  def change
    create_table :shapes do |t|
      t.string :name
      t.string :model_name
      t.string :image
      t.integer :long_side_size
      t.integer :short_side_size
      t.integer :long_side_dot_num
      t.integer :short_side_dot_num
      
      t.timestamps
    end
  end
end
