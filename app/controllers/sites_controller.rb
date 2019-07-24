class SitesController < ApplicationController
  def analysis
    @site = Site.find_or_create_by(domain: params[:domain])
  end

  def request_form; end

  private

  def site
    @site ||= params[:domain] ? Sites.where(domain: params[:domain]).first : Site.new
  end

  helper_method :site
end
