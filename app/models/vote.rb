class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :user_id, presence: true, uniqueness: { scope: [:voteable_type, :voteable_id], message: 'can only vote once.' }

end