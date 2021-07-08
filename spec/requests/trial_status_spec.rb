require 'rails_helper'

RSpec.describe "TrialStatuses", type: :request do
  describe "GET /progress" do
    it "returns http success" do
      get "/trial_status/progress"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show_progress" do
    it "returns http success" do
      get "/trial_status/show_progress"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /mark_complete" do
    it "returns http success" do
      get "/trial_status/mark_complete"
      expect(response).to have_http_status(:success)
    end
  end

end
