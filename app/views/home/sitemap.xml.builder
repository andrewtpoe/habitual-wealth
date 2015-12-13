xml.instruct!
xml.urlset(
  'xmlns:xsi'.to_sym => "http://www.w3.org/2001/XMLSchema-instance",
  'xsi:schemaLocation' => "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd",
  'xmlns'.to_sym => "http://www.sitemaps.org/schemas/sitemap/0.9",
  'xmlns:image'.to_sym => "http://www.google.com/schemas/sitemap-image/1.1",
  'xmlns:video' => "http://www.google.com/schemas/sitemap-video/1.1",
  'xmlns:geo'.to_sym => "http://www.google.com/geo/schemas/sitemap/1.0",
  'xmlns:news'.to_sym => "http://www.google.com/schemas/sitemap-news/0.9",
  'xmlns:mobile'.to_sym => "http://www.google.com/schemas/sitemap-mobile/1.0",
  'xmlns:pagemap'.to_sym => "http://www.google.com/schemas/sitemap-pagemap/1.0",
  'xmlns:xhtml'.to_sym => "http://www.w3.org/1999/xhtml"
) do
  # Root url
  xml.url do
    xml.loc "#{root_url}"
    xml.changefreq("always")
    xml.priority("1.0")
  end
  # Static pages
  @static_pages.each do |page|
    xml.url do
      xml.loc "#{page}"
      xml.changefreq("monthly")
      xml.priority("0.7")
    end
  end
  # Blog posts
  @posts.each do |post|
    xml.url do
      xml.loc "#{post_url(post)}"
      xml.lastmod post.updated_at.strftime("%F")
      xml.changefreq("weekly")
      xml.priority("0.8")
    end
  end
end
