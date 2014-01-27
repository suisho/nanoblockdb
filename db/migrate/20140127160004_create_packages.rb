class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.integer :product_id
      t.integer :user_id
      t.datetime :purchased_at

      t.timestamps
    end
  end
end
