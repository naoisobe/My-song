class Song < ApplicationRecord
  mount_uploader :thumbnail, ThumbnailUploader
  mount_uploader :voice, AudioFileUploader

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :title, presence: true, length: { maximum: 20 }
  validates :description, length: { maximum: 300 }
end
