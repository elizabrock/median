feature "User gets sitemap" do

  let!(:user){ Fabricate(:user) }
  let!(:foo_post){ Fabricate(:post, author: user, title: "Foo", body: "Bar") }
  let!(:user2){ Fabricate(:user) }
  let!(:bar_post){ Fabricate(:post, author: user2, title: "Foo", body: "Bar") }

  scenario "GET Full Sitemap" do
    visit sitemaps_path
    expect(page.source).to include('<url>')
    expect(page.source).to include('<changefreq>monthly</changefreq>')
    expect(page.source).to include('users.1')
    expect(page.source).to include('users.2')
    expect(page.source).to include('posts.1')
    expect(page.source).to include('posts.2')
  end

end