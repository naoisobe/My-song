FactoryBot.define do
  factory :song, class: Song do
    title { "MySong" }
    description { "MyText" }
    user_id { 1 }
    voice { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.mp3')) }
  end
end
