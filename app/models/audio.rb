class Audio < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :file, AudiofileUploader
end
