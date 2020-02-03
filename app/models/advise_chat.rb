class AdviseChat < ApplicationRecord
  belongs_to :instructor, optional: true unless :user.nil?
  belongs_to :user, optional: true unless :instructor.nil?
  belongs_to :practice

end
