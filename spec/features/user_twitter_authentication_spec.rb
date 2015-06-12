feature "user connects to Twitter" do

  scenario "logged users connect the blog to their Twitter account", :vcr do
    me = Fabricate(:user, name: "Bob")
    signin_as me
    click_on "Bob's Knowledge"
    page.should have_content("Link your profile with your Twitter Account")
    click_on "Link your profile with your Twitter Account"
    page.should have_content("You can now post to Twitter.")
  end

end
