class Practice < ApplicationRecord
  mount_uploader :video, VideoUploader
  belongs_to :user, dependent: :destroy
  has_many :advise_chats
end
