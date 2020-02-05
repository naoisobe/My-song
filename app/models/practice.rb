class Practice < ApplicationRecord
  mount_uploader :video, VideoUploader
  belongs_to :user
  has_many :advise_chats, dependent: :destroy

  validates :title, presence: true, length{:maximum: 20}
  validates :description, length{maximum: 400}
end
