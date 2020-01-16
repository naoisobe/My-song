FactoryBot.define do
  factory :comment do
    content { "MyString" }
    user { nil }
    song { nil }
  end
end
