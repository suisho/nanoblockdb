class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :model_name
      t.string :amazon_url, :unique

      t.timestamps
    end

    add_index :products, :model_name, :unique => true
  end
end
