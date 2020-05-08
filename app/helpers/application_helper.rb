module ApplicationHelper
  # Checks whether or not an article or comment has already been voted by the current user
  # returning either true or false
  def voted?(subject, type)
    result = false
    result = Vote.where(user_id: current_user.id, article_id: subject.id).exists? if type == 'article'
    result = Vote.where(user_id: current_user.id, comment_id: subject.id).exists? if type == 'comment'

    result
  end

  # Returns the new record created in notifications table
  def new_notification(user, notice_id, notice_type)
    notice = user.notifications.build(notice_id: notice_id,
                                      notice_type: notice_type)
    user.notice_seen = false
    user.save
    notice
  end

  # Returns either true or false depending on the current user's notice_seen column
  def notification_seen
    current_user.notice_seen
  end

  # Receives the notification object as parameter along with a type
  # and returns a User record, Post record or a Comment record
  # depending on the type supplied
  def notification_find(notice, type)
    return Article.find(notice.notice_id) if type == 'comment'
    return Article.find(notice.notice_id) if type == 'vote-article'
    return unless type == 'vote-comment'

    comment = Comment.find(notice.notice_id)
    Article.find(comment.article_id)
  end

  # Checks whether an article or a comment has already been voted by the
  # current user returning either true or false
  def voted?(subject, type)
    result = false
    if type == 'article'
      result = Vote.where(user_id: current_user.id, article_id:
                          subject.id).exists?
    end
    if type == 'comment'
      result = Vote.where(user_id: current_user.id, comment_id:
                          subject.id).exists?
    end
    result
  end
end
