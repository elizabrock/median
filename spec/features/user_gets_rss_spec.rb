feature "User gets RSS Feed" do

  let!(:user){ Fabricate(:user) }
  let!(:foo_post){ Fabricate(:post, author: user, title: "Foo", body: "Bar") }
  let!(:user2){ Fabricate(:user) }
  let!(:bar_post){ Fabricate(:post, author: user2, title: "Foo", body: "Bar") }

  scenario "GET Full RSS Feed" do
    visit root_path
    click_link "rss"
    expect(page.source).to include('rss')
    expect(page.source).to include('channel')
    expect(page.source).to include('title')
    expect(page.source).to include('author')
    expect(page.source).to include('description')
    expect(page.source).to include('pubDate')
    expect(page.source).to include("#{user.name}")
    expect(page.source).to include("#{foo_post.title}")
    expect(page.source).to include("#{user2.name}")
    expect(page.source).to include("#{bar_post.title}")
  end

  scenario "GET one Users RSS Feed" do
    visit user_posts_path(user)
    click_link "rss"
    expect(page.source).to include('rss')
    expect(page.source).to include('channel')
    expect(page.source).to include("<title>#{user.name}</title>")
    expect(page.source).to_not(include('author'))
    expect(page.source).to include('description')
    expect(page.source).to include('pubDate')
    expect(page.source).to include("#{foo_post.title}")
  end

end