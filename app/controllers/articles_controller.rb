class ArticlesController < ApplicationController
  def index; end

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

  def destroy; end

  private

  def articles_params
    params.require(:article).permit(:title, :content, :image)
  end
end
