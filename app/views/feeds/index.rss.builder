xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Median Feeds"
    xml.link root_url

    for post in @posts
      xml.item do
        xml.author post.author.name
        xml.title post.title
        xml.description post.body
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link user_posts_url(post)
        xml.guid user_posts_url(post)
      end
    end
  end
end