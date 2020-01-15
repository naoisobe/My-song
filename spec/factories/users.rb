FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "testtaro#{n}"}
    sequence(:email) { |n| "test#{n}@example.com"}
    member_status { 0 }
    password {"password"}
    encrypted_password {"password"}
  end
end
