class Post < ApplicationRecord
  acts_as_votable
  # acts_as_taggable_on :interests
  belongs_to :user
  belongs_to :interest
  has_many :comments, dependent: :destroy
  has_one_attached :image


  scope :most_recent, -> { order(created_at: :desc) }
  def self.user_interesting
    self.find_by_sql(["SELECT * FROM posts"])
    # Post.find_by_sql(["SELECT title FROM posts WHERE author = ? AND created > ?", author_id, start_date])
  end
 
  # scope :tagging, -> { where(interest_id: Post.all.find_by(interest_id: @user).content) }
 
  # Ex:- scope :active, -> {where(:active => true)}
end
