class GroupsController < ApplicationController
  before_action :set_group, except: [:create, :new, :index, :public_groups]
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy, :show]
  respond_to :html

  def subscribe
    GroupSubscription.create :user_id => current_user.id, :group_id => @group.id
    respond_with(@group)
  end
  
  def unsubscribe
    if @group.creator.id == current_user.id
      flash[:warning] = "You cannot unsubscribe from a group you have created."
    else
      current_user.group_subscriptions.find_by_group_id(@group.id).destroy
    end
    redirect_to groups_path
  end

  # Adds another user to a group
  def invite
    user = User.find_by_email(params[:username])
    if user
      # Try to find a group subscription with the same user id and group id.
      # NOTE: This returns a LIST of subscriptions, so must check if its empty
      subscription = GroupSubscription.where(:user_id => user.id, :group_id => @group.id)
      
      # if we could NOT find a matching subscription, then we can create it
      if subscription.empty?
        GroupSubscription.create :user_id => user.id, :group_id => @group.id
        flash[:success] = "Successfully added #{user.first_name} #{user.last_name} to group #{@group.group_name}."
      else
        flash[:warning] = "#{user.first_name} #{user.last_name} is already in the group #{@group.group_name}."
      end
    # Could not find the user
    else
      flash[:warning] = "Could not find user #{params[:username]}."
    end
    respond_with(@group)
  end

  def index
    if user_signed_in?
      @group = Group.new :user_id => current_user.id
      
      # This is JUST the groups that the user has made
      @my_groups = current_user.groups
      
      # This is JUST the groups that the user is subscribed to (NOT the groups that the user has made)
      @subscribed_groups = current_user.subscribed_groups
    end
  end

  def show
    @article = Article.new :group_id => @group.id
    @articles = @group.articles.page(params[:page] || 1)
    
    # Handle searching of users (to invite to group)
    if params[:search]
      @users = User.search(params[:search]).page(params[:page] || 1)
      @user_search = true
      if @users.empty?
        flash[:warning] = "Could not find any users with the search query \"#{params[:search]}\"."
      end
    end
    
    respond_with(@group)
  end

  def new
    @group = Group.new
    respond_with(@group)
  end

  def edit
  end

  def create
    p = group_params
    p[:user_id] = current_user.id
    @group = Group.new(p)
    @group.save
    # Add self to group.
    GroupSubscription.create :user_id => current_user.id, :group_id => @group.id
    respond_with(@group)
  end

  def update
    @group.update(group_params)
    respond_with(@group)
  end

  def destroy
    @group.destroy
    respond_with(@group)
  end
  
  def public_groups
    if params[:search]
      @groups = Group.search(params[:search]).page(params[:page] || 1)
      @title = "Search Results"
    else
      # By default, just display all public groups
      @groups = Group.where(:private => false).order('group_name ASC')
      @title = "Explore Public Groups"
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:user_id, :group_name, :private, :subscribers_only)
    end
    
    def correct_user
      @group = current_user.groups.find_by(id: params[:id])
      if @group.nil
        flash[:notice] = "You do not have permission to do this."
        redirect_to root_url
      end
    end
end
