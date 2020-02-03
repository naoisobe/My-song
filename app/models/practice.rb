class Practice < ApplicationRecord
  mount_uploader :video, VideoUploader
  belongs_to :user
  has_many :advise_chats
end
