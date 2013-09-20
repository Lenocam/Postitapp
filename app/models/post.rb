class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :categories_posts
  has_many :categories, through: :categories_posts

  validates :title, presence: true, length: {minimum: 5}
  validates :url, presence: true, length: {minimum: 5}
end