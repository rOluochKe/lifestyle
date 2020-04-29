class CommentsController < ApplicationController
  include ApplicationHelper

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @article = Article.find(params[:comment][:article_id])
    if @comment.save
      @notification = new_notification(@article.user, @article.id,
                                       'comment')
      @notification.save
    end
    redirect_to @article
  end

  def destroy
    @comment = Comment.find(params[:id])
    return unless current_user.id == @comment.user_id

    @comment.destroy
    flash[:success] = 'Comment deleted'
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :article_id)
  end
end
