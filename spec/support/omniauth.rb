OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
  :uid => '123545',
  :nickname => 'NashSoftwareSchool'
})
