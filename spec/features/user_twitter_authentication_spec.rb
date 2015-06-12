feature "user connects to Twitter" do

  scenario "logged users connect the blog to their Twitter account", vcr: true do
    me = Fabricate(:user, name: "Bob")
    signin_as me
    click_on "Bob's Knowledge"
    page.should have_content("Link your profile with your Twitter Account")
    click_on "Link your profile with your Twitter Account"
    page.should have_content("You can now post to Twitter.")
  end

  scenario "can handle authentication error", vcr: true do
    me = Fabricate(:user, name: "Bob")
    signin_as me
    click_on "Bob's Knowledge"
    OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
    page.should have_content("Link your profile with your Twitter Account")
    click_on "Link your profile with your Twitter Account"
    page.should have_content('Authentication failed.')
  end

end
