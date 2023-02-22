class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  self.per_page = 3

  scope :filter_by_current_user, -> (user) { where user_id: user.id }
end
