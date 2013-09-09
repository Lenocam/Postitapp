class User < ActiveRecord::Base
  has_many :comments
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :posts
end