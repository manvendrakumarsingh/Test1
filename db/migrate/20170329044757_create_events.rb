class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
