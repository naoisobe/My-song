unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAR6GR5WB2BLKTWJGP',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'smilax-my-song'
    config.cache_storage = :fog
  end
end
