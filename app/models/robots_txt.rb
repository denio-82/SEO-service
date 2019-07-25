class RobotsTxt < ApplicationRecord
  belongs_to :site

  def find_sitemap_path
    content.to_s
  end
end
