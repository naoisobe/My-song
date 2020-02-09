unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAR6GR5WB2DEGUSC3E',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'mysong-infra-s3'
    config.cache_storage = :fog
  end
end
