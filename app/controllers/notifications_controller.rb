class NotificationsController < ApplicationController
  
  before_action :set_notification
  
  def index
    
  end
  
  def update
    
  end



  private
  
    def set_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      params.require(:notification).permit(:body, :user_id)
    end
end
