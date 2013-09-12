class Category < ActiveRecord::Base
  has_many :category_posts #might not be needed
  has_many :posts, through: :category_posts
end

#unsure of pluralization