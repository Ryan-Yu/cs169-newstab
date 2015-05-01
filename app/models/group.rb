class Group < ActiveRecord::Base
  validates_presence_of :group_name
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  
  has_many :group_subscriptions, dependent: :destroy
  
  has_many :users, through: :group_subscriptions

  # Delete all of a group's articles when a group is destroyed
  has_many :articles, dependent: :destroy
  
  def followers
    users.count
  end
  
  # Searches public groups
  def self.search(query)
    Group.where(:private => false).where("group_name like ?", "%#{query}%")
  end
  
end
