class Audio < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :file, presence: true

  mount_uploader :file, AudiofileUploader
  mount_uploader :img, ImgUploader

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
