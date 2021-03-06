class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :verify_own_article, only: [:destroy]
  respond_to :html

  def index
    # User has searched by article tite
    if params[:search]
      @search_on = true
      @articles = Article.search(params[:search])
      unless @articles.empty?
        @articles = @articles.page(params[:page] || 1)
      end
      
    # User has not searched by article title, render index page as usual
    else
      @search_on = false
      @trending_articles = Article.order('likes_count DESC')
      if @trending_articles.size > 0
        @trending_articles = @trending_articles.page(params[:page] || 1)
      end
      
      # If user is signed in, then we want to render curated articles and interested articles
      if user_signed_in?
        @articles = current_user.article_feed
        @interested_articles = current_user.relevant_articles
        
        # Perform pagination if necessary
        if @articles.size > 0
          @articles = @articles.page(params[:page] || 1)
        end
        if @interested_articles.size > 0
          @interested_articles = @interested_articles.page(params[:page] || 1)
        end
      end
    end
    @categories = Category.all
    respond_with(@articles)
  end

  def show
    @comments = @article.comments.order('created_at DESC')
    @user = @article.user
    respond_with(@article)
  end

  def new
    @categories = Category.order('name ASC')
    @article = Article.new :group_id => params[:group_id]
    respond_with(@article)
  end

  def edit
    if current_user.articles.find_by_id(params[:id]).nil?
      flash[:warning] = "You do not have permission to edit this article."
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
      
      # Try to send a notification to all of the group's members EXCEPT yourself
      unless @article.group_id.nil?
        Group.find_by_id(@article.group_id).users.each do |user|
          unless user.id == current_user.id
            user.send_notification("Someone in the group #{Group.find_by_id(@article.group_id).group_name} has posted an article!", "/groups/#{@article.group_id}")
          end
          # user.send_notification("Someone in the group #{Group.find_by_id(@article.group_id).group_name} has posted an article!", "/groups/#{@article.group_id}")
        end
      end
    
      
      flash[:success] = "Article created!"
      
      # Create comment for article with initial_comment
      Comment.create!('body' => @article.initial_comment, 'user_id' => current_user.id, 'article_id' => @article.id)
      # Might need to change the location of this redirect
      redirect_to root_url
    else
      flash[:warning] = "Invalid article."
      redirect_to new_article_path
    end
    
  end

  def update
    @article.update(article_params)
    flash[:success] = "Article successfully updated."
    respond_with(@article)
  end

  def destroy
    if @article
      @article.destroy
      flash[:success] = "Article successfully destroyed."
    else
      flash[:warning] = "You do not have permission to delete this article."
    end
    # TODO: change this to another redirect location
    redirect_to root_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:url, :group_id, :title, :datetime, :content, :photo, :initial_comment, categories_ids: [])
    end
    
    # Ensure that a signed in user can only delete articles that they have posted
    def verify_own_article
      @article = current_user.articles.find_by_id(params[:id])
    end
end
