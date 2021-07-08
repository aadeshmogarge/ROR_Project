require 'rails_helper'

RSpec.describe "Subjects", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/subject/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/subject/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/subject/create"
      expect(response).to have_http_status(:success)
    end
  end

end
