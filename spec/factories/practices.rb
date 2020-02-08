FactoryBot.define do
  factory :practice, class: Practice do
    title { "MyString" }
    description { "MyText" }
    video { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.mp4')) }
    user_id { 1 }
  end
end
