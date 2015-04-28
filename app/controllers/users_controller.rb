class UsersController < ApplicationController
  
  before_filter :set_user, only: [:show, :subscribing, :subscribers, :select_interested_categories]
  
  def index
    if params[:search]
      @users = User.search(params[:search]).page(params[:page] || 1)
      @search_on = true
    else
      @users = User.all
      unless @users.empty?
        @users = @users.page(params[:page] || 1)
      end
    end
  end
  
  # We display only a user's posted articles on his/her show page
  def show
    @articles = @user.articles
    # TODO: Might need to change this?
    @groups = @user.subscribed_groups
    @categories = Category.order('name ASC')
  end
  
  # Sets @users to the users that 'this' user is subscribing
  def subscribing
    @title = "Users that " + @user.first_name + " is subscribing to"
    # TODO: Paginate users?
    @users = @user.subscribing
    render 'show_subscribe'
  end
  
  # Sets @users to the users that are subscribers to 'this' user
  def subscribers
    @title = @user.first_name + "'s subscribers"
    # TODO: Paginate users?
    @users = @user.subscribers
    render 'show_subscribe'
  end
  
  def select_interested_categories
    @selected_categories = params[:categories]
    
    # Resets the categories that the user is interested in
    @user.interested_categories.clear
    
    # @selected_categories is a hash that looks like:
    # {"1"=>"Sports", "3"=>"Fashion", "4"=>"World"}
    unless @selected_categories.nil?
      @selected_categories.each do |key, category_name|
        @user.interested_categories << Category.find_by_name(category_name)
      end
    end
    redirect_to @user
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
  
end