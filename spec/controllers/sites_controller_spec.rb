require 'rails_helper'

RSpec.describe SitesController, type: :controller do

  describe "GET #analysis" do
    it "returns http success" do
      get :analysis
      expect(response).to have_http_status(:success)
    end
  end

end
