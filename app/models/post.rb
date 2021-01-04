class Post < ApplicationRecord
  acts_as_votable
  acts_as_taggable_on :interests
  belongs_to :user
  belongs_to :interest
  has_many :comments, dependent: :destroy
  has_one_attached :image

  scope :most_recent, -> { order(created_at: :desc) }
  scope :tagging, -> { where(:interest_id => :user.interest_id)}
  # Ex:- scope :active, -> {where(:active => true)}
end
