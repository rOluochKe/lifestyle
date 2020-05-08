class ArticlesController < ApplicationController
  def index
    @categories = Category.all
    cat = params[:cat]
    @articles = if !cat.nil?
                  Article.where(category_id: cat)
                else
                  Article.all
                end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(articles_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    return unless current_user.id == @article.user_id

    @article.destroy
    flash[:success] = 'Article deleted'
    redirect_back(fallback_location: root_path)
  end

  def category_articles
    @categories = Category.all
    cat = params[:cat]
    @articles = if !cat.nil?
                  Article.where(category_id: cat)
                else
                  Article.all
                end
  end

  def update_img
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      redirect_back(fallback_location: users_path(current_user))
      return
    end

    image = params[:user][:image] unless params[:user].nil?
    if image
      @article.image = image
      if @article.save
        flash[:success] = 'Image uploaded'
      else
        flash[:danger] = 'Image uploaded failed'
      end
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def articles_params
    params.require(:article).permit(:title, :content, :image, :category_id)
  end
end
