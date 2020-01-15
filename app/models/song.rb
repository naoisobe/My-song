class Song < ApplicationRecord
  mount_uploader :thumbnail, ThumbnailUploader
  mount_uploader :voice, AudioFileUploader
end
