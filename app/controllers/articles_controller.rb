class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
  end

  private
  def article_params
    # from the params hash we permit to use these values and enter those into the article.new params
    params.require(:article).permit(:title, :description)
  end

end
