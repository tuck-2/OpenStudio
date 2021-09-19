class Audio < ApplicationRecord
  belongs_to :user

  mount_uploader :file, AudiofileUploader
end
