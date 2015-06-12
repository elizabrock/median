OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
  :uid => '123545',
  :info => {
    :nickname => 'NashSoftwareSchool' },
  :credentials => {
        :token => ENV['twitter_token'],
        :secret => ENV['twitter_token_secret']}
})
