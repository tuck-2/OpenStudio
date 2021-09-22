class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :audio

  validates :comment, presence: true
end
