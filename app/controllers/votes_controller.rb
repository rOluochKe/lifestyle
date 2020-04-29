class VotesController < ApplicationController
  include ApplicationHelper

  def create
    type = type_subject?(params)[0]
    @subject = type_subject?(params)[1]
    notice_type = "vote-#{type}"
    return unless @subject

    if already_voted?(type)
      unvote(type)
    else
      @vote = @subject.votes.build(user_id: current_user.id)
      if @vote.save
        flash[:success] = "#{type} voted!"
        @notification = new_notification(@subject.user, @subject.id,
                                         notice_type)
        @notification.save
      else
        flash[:danger] = "#{type} vote failed!"
      end
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def type_subject?(params)
    type = 'article' if params.key?('article_id')
    type = 'comment' if params.key?('comment_id')
    subject = Article.find(params[:article_id]) if type == 'article'
    subject = Comment.find(params[:comment_id]) if type == 'comment'
    [type, subject]
  end

  def already_voted?(type)
    result = false
    if type == 'article'
      result = Vote.where(user_id: current_user.id,
                          article_id: params[:article_id]).exists?
    end
    if type == 'comment'
      result = Vote.where(user_id: current_user.id,
                          comment_id: params[:comment_id]).exists?
    end
    result
  end

  def unvote(type)
    @vote = Vote.find_by(article_id: params[:article_id]) if type ==
                                                             'post'
    @vote = Vote.find_by(comment_id: params[:comment_id]) if type ==
                                                             'comment'
    return unless @vote

    @vote.destroy
    redirect_back(fallback_location: root_path)
  end
end
