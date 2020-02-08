FactoryBot.define do
  factory :comment, class: Comment do
    content { "MyString" }
    user_id { 1 }
    song_id { 1 }
  end
end
