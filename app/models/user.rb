class User < ActiveRecord::Base
  include Sluggable

  has_many :comments
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :posts

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create

  sluggable_column :username

  def admin?
    role == 'admin'
  end
end