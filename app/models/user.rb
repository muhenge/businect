class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_voter
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_one_attached :avatar
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  belongs_to :interest
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships
 
  validates :email, :uniqueness => true
  validates :username, :uniqueness => true

  def follow(user)
    active_relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end

  def self.search
    if search
      where(["name LIKE ?","%#{params[:search]}%"])
    else
      all
    end
  end
end
