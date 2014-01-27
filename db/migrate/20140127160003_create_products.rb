class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :model_name
      t.string :amazon_url

      t.timestamps
    end
  end
end
