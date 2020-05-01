class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :notice_id
      t.string :type
      t.boolean :seen

      t.timestamps
    end
  end
end
