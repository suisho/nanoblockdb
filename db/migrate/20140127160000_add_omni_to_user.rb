class AddOmniToUser < ActiveRecord::Migration
  def change
    add_column :users, :uid, :integer
    add_column :users, :provider, :string
    add_column :users, :name, :string
    add_column :users, :image, :string
    
    add_index :users, [:uid, :provider], unique: true
  end
end
