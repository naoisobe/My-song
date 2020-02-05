class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :profile_image, ProfileImageUploader

  has_many :songs, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :practices, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_songs, through: :likes, source: :song
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :user
  has_many :advise_chats, dependent: :destroy

  enum member_status: { 一般会員: 0, 有料会員: 1 }

  validates :name, presence: true, length: { maximum: 15 }
  validates :description, length: { maximum: 100 }

  def my_comment?(comment)
    comments.exists?(id: comment.id)
  end

  def my_message?(message)
    advise_chats.exists?(id: message.id)
  end

  def already_liked?(song)
    likes.exists?(song_id: song.id)
  end

  def follow(other_user)
    relationships.find_or_create_by(follow_id: other_user.id) unless self == other_user
  end

  def unfollow(other_user)
    relationship = relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    followings.include?(other_user)
  end
end
