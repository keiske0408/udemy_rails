class ArticlesController < ApplicationController
  def show
    #byebug
    @article = Article.find(params[:id])
  end
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.save
    redirect_to articles_path
  end

#   private
#   def article_params
#     params.require(:article).permit(:title, :description)
#   end
end