class Site < ApplicationRecord
  has_many :pages, dependent: :destroy
  has_one :robots_txt, dependent: :destroy

  after_initialize :set_https_attr, :set_www_subdomain_attr
  after_create_commit :check_robots_txt
  after_find :check_robots_txt

  validates :domain, presence: true, uniqueness: true

  def https?
    https
  end

  def www_subdomain?
    www_subdomain
  end

  private

  def set_https_attr
    response = HTTP.get("https://#{domain}")
    
    update(https: true)
  rescue HTTP::ConnectionError, OpenSSL::SSL::SSLError
    update(https: false)
  end

  def set_www_subdomain_attr

  end

  def check_robots_txt
    Services::CheckRobotsTxt.call(self)
  end
end
