class UsersController < ApplicationController
  
  before_filter :set_user, only: [:show, :subscribing, :subscribers]
  
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

  private
    def set_user
      @user = User.find(params[:id])
    end
  
end