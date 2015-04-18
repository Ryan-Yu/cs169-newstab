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

  def invite
    user = User.find_by_email(params[:username])
    if user
      # TODO: This method does not exist
      # TODO: Need to change the VERB for group subscriptions... because followings are called subscriptions too
      if user.subscribes current_user
        GroupInvitation.create :user_if => user.id, :group_id => @group.id
        flash[:notice] = "Invitation has been sent"
      else
        flash[:notice] = "You can only invite subscriberheroku s"
      end
    else
      flash[:notice] = "Could not find user #{params[:username]}"
    end
    respond_with(@group)
  end

  def index
    @groups = Group.where(:private => false, :subscribers_only => false)
    if user_signed_in?
      @my_groups = current_user.groups
      @group_invitations = current_user.group_invitations
      @subscribed_groups = current_user.subscribed_groups
      @subscribers_groups = current_user.subscribed_users_groups.where(:private => false)
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
