class Practice < ApplicationRecord
  mount_uploader :video, VideoUploader
  belongs_to :user
  has_many :advise_chats

  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :video, presence: true
end
