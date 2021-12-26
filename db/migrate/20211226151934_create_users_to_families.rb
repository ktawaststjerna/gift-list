class CreateUsersToFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :users_to_families do |t|
      t.references :user, null: false, foreign_key: true
      t.references :family, null: false, foreign_key: true

      t.timestamps
    end
  end
end
