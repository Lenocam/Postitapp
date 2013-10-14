class Category < ActiveRecord::Base
  include Sluggable
  
  has_many :categories_posts
  has_many :posts, through: :categories_posts

  validates :name, presence: true

  sluggable_column :name
end