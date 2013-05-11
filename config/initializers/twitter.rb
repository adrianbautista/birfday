Twitter.configure do |config|
  config.consumer_key = ENV['B_TWITTER_CON']
  config.consumer_secret = ENV['B_TWITTER_CONSEC']
  config.oauth_token = ENV['B_TWITTER_OAUTH']
  config.oauth_token_secret = ENV['B_TWITTER_OAUTHSEC']
end