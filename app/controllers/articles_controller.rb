class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :verify_own_article, only: [:destroy]
  respond_to :html

  def index
    if user_signed_in?
      @articles = current_user.article_feed
      # TODO: if there are too few articles on a user's feed, we want to display more articles
    else
      @articles = Article.all
    end
    @articles = @articles.page(params[:page] || 1).per(12)
    @categories = Category.all
    respond_with(@articles)
  end

  def show
    respond_with(@article)
  end

  def new
    @categories = Category.order('name ASC')
    @article = Article.new
    respond_with(@article)
  end

  def edit
    if current_user.articles.find_by_id(params[:id]).nil?
      flash[:notice] = "You do not have permission to edit this article."
      redirect_to @article
    end
  end

  def create
    # Creates article object with current_user_id, initial_comment, and URL
    @article = current_user.articles.build(article_params)
    
    # Uses Pismo (gem) to grab title, content, photo of URL
    @article.populate_url_fields
    
    # Populate article's categories
    @selected_categories = params[:categories]
    
    # @selected_categories is a hash that looks like:
    # {"1"=>"Sports", "3"=>"Fashion", "4"=>"World"}
    unless @selected_categories.nil?
      @selected_categories.each do |key, category_name|
        @article.categories << Category.find_by_name(category_name)
      end
    end
    
    if @article.save
      flash[:success] = "Article created!"

      # Might need to change the location of this redirect
      redirect_to root_url
    else
      flash[:notice] = "Invalid article."
      redirect_to new_article_path
    end
    
  end

  def update
    @article.update(article_params)
    flash[:notice] = "Article successfully updated."
    respond_with(@article)
  end

  def destroy
    if @article
      @article.destroy
      flash[:notice] = "Article successfully destroyed."
    else
      flash[:notice] = "You do not have permission to delete this article."
    end
    # TODO: change this to another redirect location
    redirect_to root_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:url, :title, :datetime, :content, :photo, :initial_comment, categories_ids: [])
    end
    
    # Ensure that a signed in user can only delete articles that they have posted
    def verify_own_article
      @article = current_user.articles.find_by_id(params[:id])
    end
end
