class Services::SitemapAnalyzer
  def initialize(site)
    @site = site
  end
  
  def self.call(site)
    new(site).call
  end

  def call
    file = sitemap_from_site
    parse(file) if file
  end

  def sitemap_from_site
    scheme = @site.https? ? "https://" : "http://"
    url = @site.robots_txt&.find_sitemap_path ? @site.robots_txt.find_sitemap_path : "#{scheme}#{@site.domain}/sitemap.xml"
    res = HTTP.follow.get(url)

    res.code == 200 ? res : nil
  end

  def parse(file)
    Nokogiri::XML(file).css('url').each.with_object([]) do |link, arr|
      arr << link.css('loc').text
    end
  end  
end