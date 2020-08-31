class Memo < ApplicationRecord
  belongs_to :user, -> { includes(profile_image_attachment: :blob) }

  validates :body, presence: true
end
