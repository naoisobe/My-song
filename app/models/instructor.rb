class Instructor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login_id]
  validates :login_id, presence: true
  has_many :advise_chats, dependent: :destroy

    def my_message?(message)
    advise_chats.exists?(id: message.id)
  end
end
