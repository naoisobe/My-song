class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    enum member_status: { general_member: 0, paid_member: 1 }

    validates :name, presence: true, uniqueness: true, length: { minimum: 6 }
    validates :description, length: { maximum: 100 }
    
end
