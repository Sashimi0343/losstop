require 'rails_helper'

RSpec.describe "Bazaars", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/bazaars/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/bazaars/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/bazaars/create"
      expect(response).to have_http_status(:success)
    end
  end

end
