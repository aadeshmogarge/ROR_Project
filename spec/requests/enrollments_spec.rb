require 'rails_helper'

RSpec.describe "Enrollments", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/enrollments/index"
      expect(response).to have_http_status(:success)
    end
  end

end
