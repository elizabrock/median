OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
  :uid => '123545',
  :info => {
    :nickname => 'NashSoftwareSchool' },
  :credentials => {
        :token => '09876t5iopjcvbhjkjhbvbnjk',
        :secret => '09uyfdxdfyu890oijhnbpoi98765rfvghjk8765reswdfghjkl'}
})
