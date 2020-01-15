FactoryBot.define do
  factory :song do
    title { "MySong" }
    description { "MyText" }
    user_id { 1 }
    thumbnail { "Mythumbnail" }
    voice { "Myvoice" }
  end
end
