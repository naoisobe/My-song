FactoryBot.define do
  factory :user, class: User do
    sequence(:name) { "testtaro" }
    sequence(:email) { "test@example.com"}
    member_status { 0 }
    password {"password"}
    encrypted_password {"password"}
  end

  factory :other_user, class: User do
    sequence(:name) { "testtaro" }
    sequence(:email) { "aaa@example.com"}
    member_status { 0 }
    password {"12345678"}
    encrypted_password {"12345678"}
  end
end
