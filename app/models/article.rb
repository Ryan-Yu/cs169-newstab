class Article < ActiveRecord::Base
  require 'pismo'
  
  validates_presence_of :url
  validates_presence_of :initial_comment
  validates_presence_of :user_id
  
  belongs_to :user
  belongs_to :group
  has_many :comments
  has_many :likes
  
  has_and_belongs_to_many :categories
  
  # Given an already-initialized Article object with a URL, initial_comment, and user_id parameter
  # (these parameters' presence are validated), this method invokes the Pismo gem to 
  # populate the title, content, datetime, and photo attributes of the article
  def populate_url_fields
      doc = Pismo::Document.new(self.url)
      begin
        img = doc.images[0]
      rescue
        img = ""
      end
      self.title = doc.title
      self.content = doc.body
      self.datetime = doc.datetime
      self.photo = img
  end
  
  # Article title search functionality
  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
