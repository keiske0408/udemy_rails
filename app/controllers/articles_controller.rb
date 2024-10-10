class ArticlesController < ApplicationController
  def show
    # byebug
    article_params
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(set_article)
    if @article.save
      flash[:notice] = "Article successfully created"
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    article_params
  end

  def update
    article_params
    if @article.update(set_article)
      flash[:notice] = "Article edited successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    article_params
    if @article.destroy
      flash[:notice] = "Successfully deleted"
    else
      flash[:alert] = "Failed to delete article"
    end
    redirect_to articles_path

  end

  private
  def article_params
    @article = Article.find(params[:id])
  end

  def set_article
    (params.require(:article).permit(:title, :description))
  end
end

