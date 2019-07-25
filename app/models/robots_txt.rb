class RobotsTxt < ApplicationRecord
  belongs_to :site

  def find_sitemap_path
    instruction = content.split("\n").select { |i| i =~ /^sitemap*/i }
    return unless instruction.any?

    instruction.first.split(" ").last
  end
end
