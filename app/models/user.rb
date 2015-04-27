class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  # 'this' user is actively subscribed to other users
  # i.e. user.active_subscriptions.create(subscribed_id: another_user.id) means that
  # 'this' user is following another_user
  # i.e. active_subscription.subscriber returns the subscriber
  # i.e. active_subscription.subscribed returns the subscribed user
  has_many :active_subscriptions, class_name: "Subscription", foreign_key: "subscriber_id", dependent: :destroy
  # the other users that 'this' user is subscribing to
  # i.e. user.subscribing.include?(other_user) checks whether 'this' user is subscribing to other_user
  has_many :subscribing, through: :active_subscriptions, source: :subscribed
  
  # Groups created by this user
  has_many :groups
  
  # Groups to which this use has been invited
  has_many :group_invitations
  has_many :invited_groups, through: :group_invitations, source: :group
  
  # Groups to which this user actively subscribes
  has_many :group_subscriptions
  has_many :subscribed_groups, through: :group_subscriptions, source: :group
  
  # Groups created by people to which the user subscribes
  has_many :subscribed_users_groups, through: :subscribing, source: :groups
  
  
  # reverse of active_subscriptions
  # represents other users who are subscribed to 'this' user
  has_many :passive_subscriptions, class_name: "Subscription", foreign_key: "subscribed_id", dependent: :destroy
  # i.e. user.subscribers.include?(other_user) checks whether other_user is subscribing to 'this' user
  has_many :subscribers, through: :passive_subscriptions, source: :subscriber
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.image = auth.info.image
      user.large_image = "http://graph.facebook.com/#{user.uid}/picture?type=large"
    end
  end
  
  # Checks whether the 'self' user has liked the given article
  def likes? article
    !!(article_like article)
  end
  
  # Gets the like for the given article that the 'self' user has created
  def article_like article
    self.likes.find_by_article_id(article.id)
  end
  
  ##### Utility methods for subscriptions #####
  
  # Subscribes to another user
  def subscribe(other_user)
    active_subscriptions.create(subscribed_id: other_user.id)
  end
  
  # Unsubscribes to another user
  def unsubscribe(other_user)
    active_subscriptions.find_by(subscribed_id: other_user.id).destroy
  end
  
  # Returns true if the current user is following the other user
  def subscribing?(other_user)
    self.subscribing.include?(other_user)
  end
  
  
  def subscribed_group? group
    subscribed_groups.include? group
  end
  
  
  # Returns a user's article feed, which includes:
  # (1) articles that have been posted by users that the user is subscribed to
  # TODO: We need to paginate or introduce infinite scroll for this
  def article_feed
    Article.where("user_id IN (?)", subscribing_ids)
  end
  
  def full_name
    first_name.to_s + " " + last_name.to_s
  end
  
  # Hacky implementation of first/last name search
  def self.search(query)
    if (query.split.size > 1)
      where("first_name like ? OR last_name like ? OR first_name like ? OR last_name like ?", "%#{query}%", "%#{query}%", "%#{query.split[0]}%", "%#{query.split[1]}%")\
    elsif query.include? "@"
      # Search query is an email
      where("email like ?", "%#{query}%")
    else
      where("first_name like ? OR last_name like ? OR first_name like ?", "%#{query}%", "%#{query}%", "%#{query.split[0]}%")
    end
  end
  
end
