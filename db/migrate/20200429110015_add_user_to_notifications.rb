class AddUserToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_reference :notifications, :user, null: false, foreign_key: true
  end
end