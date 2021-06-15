require 'rails_helper'

RSpec.describe "OrderBazaars", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/order_bazaars/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/order_bazaars/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/order_bazaars/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/order_bazaars/show"
      expect(response).to have_http_status(:success)
    end
  end

end
