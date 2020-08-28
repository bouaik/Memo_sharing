class Friendship < ApplicationRecord
    belongs_to :follower, class_name: :User
    belongs_to :followed, class_name: :User

    validates :follower_id, presence: true
    validates :followed_id, presence: true

    has_one_attached :profile_image
    has_one_attached :cover_image

end
