feature "User Signs Up" do

  background do
    visit root_path
    click_on "Sign Up"
  end

  scenario "Happy Path" do
    page.should_not have_link("Sign Up")
    fill_in "Name", with: "Joe"
    fill_in "Email", with: "joe@example.com"
    fill_in "Username", with: "Joe_schmoe"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_button "Sign Up"
    page.should have_content("Welcome, Joe")
    click_on "Sign Out"
    click_on "Sign In"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "password1"
    click_button "Sign In"
    page.should have_content("Welcome back, Joe")
  end

  scenario "Error Path" do
    fill_in "Name", with: ""
    fill_in "Email", with: "joeexample.com"
    fill_in "Username", with: ""
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "food"
    click_on "Sign Up"
    page.should have_alert("Please fix the errors below to continue.")

    page.should have_error("can't be blank", on: "Name")
    page.should have_error("must be an email address", on: "Email")
    page.should have_error("can't be blank", on: "Username")
    page.should have_error("doesn't match Password", on: "Password confirmation")

    fill_in "Name", with: "Sally"
    fill_in "Email", with: "joe@example.com"
    fill_in "Username", with: "Sally-Sue-Migoo"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_on "Sign Up"
    page.should have_content("Welcome, Sally")
  end

  scenario "invalid username" do
    fill_in "Name", with: "Brandon"
    fill_in "Email", with: "joe@example.com"
    fill_in "Username", with: "b rad"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_on "Sign Up"
    page.should have_alert("Please fix the errors below to continue.")
    page.should have_error("can't have whitespace or special characters", on: "Username")

    fill_in "Name", with: "Brandon"
    fill_in "Email", with: "joe@example.com"
    fill_in "Username", with: "brad"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_on "Sign Up"
    page.should have_content("Welcome, Brandon")
  end
end
