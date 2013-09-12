class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :category_posts
  has_many :categories, through: :category_posts
end