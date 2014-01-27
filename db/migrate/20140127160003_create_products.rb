class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :model_name
      t.string :asin, :null => false
      t.string :image_url

      t.timestamps
    end

    add_index :products, :model_name, :unique => true
    add_index :products, :asin,       :unique => true
  end
end
