class Post < ActiveRecord::Base
  belongs_to :comments
  belongs_to :user, through: :comments
end