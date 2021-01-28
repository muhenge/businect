class Post < ApplicationRecord
  acts_as_votable
  belongs_to :user
  belongs_to :interest
  has_many :comments, dependent: :destroy
  has_one_attached :image

  scope :most_recent, -> { order(created_at: :desc) }

end
