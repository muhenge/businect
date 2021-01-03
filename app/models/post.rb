class Post < ApplicationRecord
  acts_as_votable
  acts_as_taggable_on :field_of_interest
  belongs_to :user
  has_many :comments
  has_one_attached :image
end
