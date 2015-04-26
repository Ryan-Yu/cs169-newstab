class GroupsController < ApplicationController
  before_action :set_group, except: [:create, :new, :index]

  respond_to :html

  def subscribe
    if user_signed_in?
      GroupSubscription.create :user_id => current_user.id, :group_id => @group.id
    else
      flash[:notice] = "Must sign in before subscribing"
    end
    respond_with(@group)
  end
  
  def unsubscribe
    if user_signed_in?
      current_user.group_subscriptions.find_by_group_id(@group.id).destroy
    end
    redirect_to groups_path
  end

  # Adds another user to a group
  def invite
    user = User.find_by_email(params[:username])
    if user
      GroupSubscription.create :user_id => user.id, :group_id => @group.id
      flash[:notice] = "Successfully added user #{user.email} to group #{@group.group_name}"
    else
      flash[:notice] = "Could not find user #{params[:username]}"
    end
    respond_with(@group)
  end

  def index
    @groups = Group.where(:private => false)
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
    @articles = @group.articles.page(params[:page] || 1).per(12)
    
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

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:user_id, :group_name, :private, :subscribers_only)
    end
end
