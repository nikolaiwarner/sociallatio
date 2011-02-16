CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  
  config.s3_access_key_id = 'xxxxxx'
  config.s3_secret_access_key = 'xxxxxx'
  config.s3_bucket = 'name_of_bucket'
end