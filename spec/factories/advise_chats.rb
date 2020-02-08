FactoryBot.define do
  factory :advise_chat, class: AdviseChat do
    message { "MyString" }
    instructor_id { 1 }
    user_id { nil }
    practice_id { 1 }
  end
end
