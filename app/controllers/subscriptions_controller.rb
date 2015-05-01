class SubscriptionsController < ApplicationController
  
  before_action :authenticate_user!
  
  def create
    # parameter subscribed_id received from hidden_field_tag in _subscribe_form
    user = User.find(params[:subscribed_id])
    # helper method defined in user model
    current_user.subscribe(user)
    user.send_notification("#{current_user.first_name} #{current_user.last_name} has subscribed to you!", "users/#{current_user.id}")
    redirect_to user
  end

  def destroy
    user = Subscription.find(params[:id]).subscribed
    # helper method defined in user model
    current_user.unsubscribe(user)
    redirect_to user
  end
  
end
