class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :profile_image, ProfileImageUploader

  enum member_status: { 一般会員: 0, 有料会員: 1 }

  validates :name, presence: true
  validates :description, length: { maximum: 100 }

  has_many :songs, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :practices, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_songs, through: :likes, source: :song

  def my_comment?(comment)
    comments.exists?(id: comment.id)
  end

  def already_liked?(song)
    likes.exists?(song_id: song.id)
  end
end
