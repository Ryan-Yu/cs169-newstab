class Group < ActiveRecord::Base
  
  belongs_to :creator, class_name: "User", foreign_key: "user_id", dependent: :destroy
  
  has_many :group_subscriptions
  
  has_many :users, through: :group_subscriptions

  has_many :articles
  
  def followers
    users.count
  end
  
  # Article title search functionality
  def self.search(query)
    where("group_name like ?", "%#{query}%")
  end
  
end
