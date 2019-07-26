class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
    render json: Services::PageParser.new(@page).call
  end
end
