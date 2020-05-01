class ChangeTypeInNotifications < ActiveRecord::Migration[6.0]
  def change
    rename_column :notifications, :type, :notice_type
  end
end