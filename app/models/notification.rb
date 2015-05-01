class Notification < ActiveRecord::Base
  belongs_to :user
  
  def mark_as_seen
    self.seen = true
    self.save!
  end
end
