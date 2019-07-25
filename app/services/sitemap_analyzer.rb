class Services::SitemapAnalyzer
  def initialize(site)
    @site = site
  end
  
  def self.call(site)
    new(site).call
  end

  def call
    
  end
end