class AddBoughtByToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :bought_by, :string
  end
end
