class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memos

  has_many :active_friendships, class_name: :Friendship, foreign_key: :follower_id, dependent: :destroy
  has_many :following, through: :active_friendships, source: :followed

  has_many :passive_friendships, class_name: :Friendship, foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :passive_friendships, source: :follower


  def follow(user)
    active_friendships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_friendships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end




  def username
    self.email.split('@').first.capitalize
  end
end
