class ChangeVotesFkAllowNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null  :votes, :comment_id, true
    change_column_null  :votes, :article_id, true
  end
end