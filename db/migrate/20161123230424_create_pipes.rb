class CreatePipes < ActiveRecord::Migration[5.0]
  def change
    create_table :pipes do |t|
      t.integer :from_id
      t.string :from_type
      t.integer :to_id
      t.string :to_type

      t.timestamps
    end

    add_index :pipes, [:from_id, :from_type]
    add_index :pipes, [:to_id, :to_type]
  end
end