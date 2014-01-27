class CreatePackageContents < ActiveRecord::Migration
  def change
    create_table :package_contents do |t|
      t.integer :package_id
      t.integer :color_id
      t.integer :shape_id
      t.integer :count

      t.timestamps
    end
  end
end
