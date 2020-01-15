class Like < ApplicationRecord
  belongs_to :song
  belongs_to :user
  validates_uniqueness_of :song_id, scope: :user_id
end
