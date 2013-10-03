class Post < ActiveRecord::Base
  include VoteableReedOctober

  has_many :comments
  belongs_to :user
  has_many :categories_posts
  has_many :categories, through: :categories_posts
  

  validates :title, presence: true, length: {minimum: 5}
  validates :url, presence: true, length: {minimum: 5}

  after_validation :generate_slug

  def generate_slug
    self.slug = self.title.gsub(' ', '-').downcase    
  end

  def to_param
    self.slug    
  end

end