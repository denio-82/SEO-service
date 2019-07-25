class Page < ApplicationRecord
  belongs_to :site

  validates :url, presence: true, format: URI::regexp, uniqueness: { scope: [:site_id, :url] }
end
