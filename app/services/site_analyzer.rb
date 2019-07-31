class Services::SiteAnalyzer 
  def initialize(domain)
    @domain = clearing(domain)
  end

  def call
    return unless site_accessible?

    @site = Site.find_or_create_by!(domain: @domain)
    return unless @site

    check_https_attr
    check_www_subdomain_attr
    check_robots_txt
    check_sitemap

    @site
  end

  private

  def clearing(domain)
    domain.strip.downcase.split("//").last.split("/").first
  end
  
  def site_accessible?
    @res = HTTP.follow.get("http://#{@domain}")
    @res.code == 200 ? true : false
  rescue HTTP::ConnectionError, OpenSSL::SSL::SSLError
    false
  end

  def check_https_attr
    HTTP.get("https://#{@domain}")
    @site.update(https: true)
  rescue HTTP::ConnectionError, OpenSSL::SSL::SSLError
    @site.update(https: false)
  end

  def check_www_subdomain_attr
    if @domain =~ /^www\.*/
      alternative_res = HTTP.follow.get("http://#{@domain.from(4)}")
    else
      alternative_res = HTTP.follow.get("http://www.#{@domain}")
    end

    if @res.body.readpartial == alternative_res.body.readpartial
      @site.update(www_subdomain: true) 
    else
      @site.update(www_subdomain: false)
    end
  rescue HTTP::ConnectionError, OpenSSL::SSL::SSLError
    @site.update(www_subdomain: false)
  end

  def check_robots_txt
    Services::CheckRobotsTxt.call(@site)
  end

  def check_sitemap
    pages = Services::SitemapAnalyzer.call(@site)
    return unless pages
    pages.reject { |i| i.blank? }
    
    saved_pages = @site.pages.pluck(:url)

    new_pages = pages - saved_pages
    removed_pages = saved_pages - pages

    @site.pages.where(url: removed_pages).destroy_all if removed_pages.any?
    @site.pages.create!(new_pages.collect { |i| { url: i } }) if new_pages.any?
  end
end
