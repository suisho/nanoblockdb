class AddTransparentToColors < ActiveRecord::Migration
  def change
    add_column :colors, :is_transparent, :boolean
  end
end
