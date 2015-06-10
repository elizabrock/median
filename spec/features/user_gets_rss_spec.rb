feature "User gets RSS Feed" do

  let!(:user){ Fabricate(:user) }
  let!(:foo_post){ Fabricate(:post, author: user, title: "Foo", body: "Bar") }

  scenario "GET Full RSS Feed" do
    visit root_path
    click_link "rss"
    page.has_content?('rss')
    page.has_content?('channel')
    page.has_content?('title')
    page.has_content?('author')
    page.has_content?('description')
    page.has_content?('pubDate')
  end

  scenario "GET one Users RSS Feed" do
    visit user_posts_path(user)
    click_link "rss"
    page.has_content?('rss')
    page.has_content?('channel')
    page.has_content?('<title>#{user.name}</title>')
    page.should_not(have_content('author'))
    page.has_content?('description')
    page.has_content?('pubDate')
  end

end