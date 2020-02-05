class AdviseChat < ApplicationRecord
  belongs_to :instructor, optional: true unless :user.nil?
  belongs_to :user, optional: true unless :instructor.nil?
  belongs_to :practice, dependent: :destroy

  validates :message, presence: true, length: { maximum: 1000 }
end
