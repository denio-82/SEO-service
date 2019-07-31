class SitesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy]

  def analysis
    @site = Services::SiteAnalyzer.new(params[:domain]).call
  end

  def request_form; end

  def index
    @sites = Site.all
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to sites_path, alert: "Site was successfuly deleted from database."
  end
end
