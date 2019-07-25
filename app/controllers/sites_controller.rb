class SitesController < ApplicationController
  def analysis
    @site = Services::SiteAnalyzer.new(params[:domain]).call
  end

  def request_form; end
end
