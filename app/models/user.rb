class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :profile_image, ProfileImageUploader

  enum member_status: { general_member: 0, paid_member: 1 }

  validates :name, presence: true
  validates :description, length: { maximum: 100 }

  has_many :songs, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :comments
  has_many :likes
  has_many :liked_songs, through: :likes, source: :song

  def my_comment?(comment)
    comments.exists?(id: comment.id)
  end

  def already_liked?(song)
    likes.exists?(song_id: song.id)
  end
end
