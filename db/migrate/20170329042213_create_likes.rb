class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.boolean :status
      t.string :likable_type
      t.integer :likable_id
      t.integer :likable_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
