class ArticlesController < ApplicationController

  # method used to list the articles present in the db and show to the webpage
  def index
    @articles = Article.all
  end

  # form for creating a new article
  def new
    @article = Article.new
  end

  # function being invoked when the article is being created after pressing the create article submit btn.
  # here all the validations are made
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      # do something
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render :new
    end
    #redirect_to article_path(@article)
  end

  # renders the form for editing the article
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end


  def show
    @article = Article.find(params[:id])

  end

  private
  def article_params
    # from the params hash we permit to use these values and enter those into the article.new params
    params.require(:article).permit(:title, :description)
  end

end
