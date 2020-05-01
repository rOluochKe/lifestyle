class AddNoticeSeenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :notice_seen, :boolean, default: true
  end
end