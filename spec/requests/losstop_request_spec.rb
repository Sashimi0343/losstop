require 'rails_helper'

RSpec.describe "Losstops", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/losstop/index"
      expect(response).to have_http_status(:success)
    end
  end

end
