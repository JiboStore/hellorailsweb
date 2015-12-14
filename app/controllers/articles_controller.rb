class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
  end
  
  def create
    #render plain: params[:article].inspect
    #render plain: params[:article].inspect
    #@article = Article.new(params[:article]) #causes ActiveModel::ForbiddenAttributesError
    @article = Article.new(article_params(params))
    @article.save
    redirect_to @article
  end
  
  private
  def article_params p
    p.require(:article).permit(:title, :text)
  end
end
