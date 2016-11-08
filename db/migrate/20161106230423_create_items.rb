class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.string :colour
      t.integer :size
      t.string :link
      t.string :detail
      t.boolean :item_bought
      t.integer :family_id, index: true
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
