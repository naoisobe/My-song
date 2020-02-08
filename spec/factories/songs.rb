FactoryBot.define do
  factory :song, class: Song do
    title { "MySong" }
    description { "MyText" }
    user
    voice { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.mp3')) }
  end
end
