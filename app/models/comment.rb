class Comment < ActiveRecord::Base
  include VoteableReedOctober

  belongs_to :user
  belongs_to :post

  validates :body, presence: true
end