class Song < ApplicationRecord
  mount_uploader :thumbnail, ThumbnailUploader
  mount_uploader :voice, AudioFileUploader

  validates :title, presence: true, length: { maximum: 20 }
  validates :description, length: { maximum: 300 }
end
