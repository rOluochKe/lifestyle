class ChangeSeenInNotifications < ActiveRecord::Migration[6.0]
  def change
    change_column  :notifications, :seen, :boolean, default: false
  end
end