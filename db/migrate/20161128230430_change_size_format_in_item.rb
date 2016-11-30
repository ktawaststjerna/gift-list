class ChangeSizeFormatInItem < ActiveRecord::Migration
  def change
    change_column :items, :size, :string
  end
end