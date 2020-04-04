class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show, :update, :destroy]

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def create 
    @article = Article.new(article_params)

    if @article.save do
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    end
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was deleted successfully."
    redirect_to articles_path 
  end

  private
  def set_article 
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
