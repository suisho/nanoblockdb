class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name, :null => false
      t.string :code, :null => false

      t.timestamps
    end
  end
end
