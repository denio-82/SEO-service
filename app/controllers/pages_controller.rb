class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
    @parsed_page = Services::PageParser.new(@page).call
  end
end
