class Site < ApplicationRecord
  has_many :pages, dependent: :destroy
  has_one :robots_txt, dependent: :destroy

  validates :domain, presence: true, uniqueness: true#, format: URI.regexp

  def https?
    https
  end

  def www_subdomain?
    www_subdomain
  end
end
