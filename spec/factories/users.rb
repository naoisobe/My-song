FactoryBot.define do
  factory :user, class: User do
    sequence(:name) { "testtaro" }
    sequence(:email) { "test@example.com"}
    member_status { 0 }
    password {"password"}
    encrypted_password {"password"}
  end
end
