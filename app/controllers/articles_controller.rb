class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    #render plain: params[:article].inspect
    #render plain: params[:article].inspect
    #@article = Article.new(params[:article]) #causes ActiveModel::ForbiddenAttributesError
    @article = Article.new(article_params(params))
    if ( @article.save )
      redirect_to @article
    else
      render "new"
    end
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update article_params params
      redirect_to @article
    else
      render "edit"
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    redirect_to articles_path
  end
  
  private
  def article_params p
    p.require(:article).permit(:title, :text)
  end
end
