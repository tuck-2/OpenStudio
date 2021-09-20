class Audio < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  mount_uploader :file, AudiofileUploader

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
