class Services::CheckRobotsTxt
   def initialize(site)
    @site = site
  end

  def self.call(site)
    new(site).call
  end

  def call
    @response = response_from_site

    unless @response
      @site.robots_txt.destroy if @site.robots_txt
      return
    end

    if @response && @site.robots_txt
      update_robots_txt
    else
      make_robots_txt
    end
  end

  private  
   
  def response_from_site
    scheme = @site.https? ? "https://" : "http://"
    res = HTTP.follow.get("#{scheme}#{@site.domain}/robots.txt")

    res.code == 200 ? res : nil
  end


  def make_robots_txt
    @site.create_robots_txt(content: @response.body,
                            last_modified: @response['last-modified'])      
  end
    
  def update_robots_txt
    if @response['last-modified'] != @site.robots_txt.last_modified
      @site.robots_txt.update(content: @response.body,
                              last_modified: @response['last-modified'])
    end
  end
end