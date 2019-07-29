class Site < ApplicationRecord
  DOMAIN_REGEXP=/\A(((?!-))(xn--|_{1,1})?[a-z0-9-]{0,61}[a-z0-9]{1,1}\.)*(xn--)?([a-z0-9][a-z0-9\-]{0,60}|[a-z0-9-]{1,30}\.[a-z]{2,})\z/

  has_many :pages, dependent: :destroy
  has_one :robots_txt, dependent: :destroy

  validates :domain, presence: true, uniqueness: true, format: DOMAIN_REGEXP

  def https?
    https
  end

  def www_subdomain?
    www_subdomain
  end
end
