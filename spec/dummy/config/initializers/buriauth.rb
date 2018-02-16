BuriAuth.setup do |config|
  config.resource_class = 'User'
  config.resource_identity_class = 'Identity'
  config.omniauth_providers = %i[facebook google_oauth2].freeze
  config.facebook_app_id = ENV['FACEBOOK_APP_ID']
  config.facebook_app_secret = ENV['FACEBOOK_APP_SECRET']
  config.google_app_id = ENV['FACEBOOK_APP_ID']
  config.google_app_secret = ENV['FACEBOOK_APP_SECRET']
end
