class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :notice_id
      t.string :notice_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
