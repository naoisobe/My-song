FactoryBot.define do
  factory :instructor, class: Instructor do
    sequence(:name) { "testtaro" }
    sequence(:email) { "test@example.com"}
    description { "はじめまして" }
    login_id { "test-login_id"}
    password {"password"}
    encrypted_password {"password"}
  end
end
