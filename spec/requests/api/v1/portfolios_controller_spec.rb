require 'rails_helper'

RSpec.describe "Api::V1::Portfolios", type: :request do
  let!(:portfolio) { create(:portfolio) }

  describe "GET /api/v1/portfolios" do
    it "returns a list of portfolios" do
      get "/api/v1/portfolios"
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(JSON.parse(response.body)['data'].size).to eq(1)
    end
  end

  describe "GET /api/v1/portfolios/:id" do
    it "returns the portfolio" do
      get "/api/v1/portfolios/#{portfolio.id}"
      # puts response.body

      expect(response).to have_http_status(:success)

      json = JSON.parse(response.body)
      expect(json["data"]["id"]).to eq(portfolio.id) 
      expect(json["data"]["name"]).to eq(portfolio.name)
    end
  end

  # describe "POST /api/v1/portfolios" do
  #   context "with valid parameters" do
  #     let(:valid_attributes) { 
  #       { 
  #         name: "Test Portfolio",
  #         date: "2024-03-18",
  #         tag: ["Test"],
  #         about: "Test about",
  #         function: "Test function",
  #         appeal: "Test appeal",
  #         time: "1ヶ月",
  #         front_skill: ["Test"],
  #         back_skill: ["Test"],
  #         infra_skill: ["Test"]
  #       }
  #     }

  #     it "creates a new portfolio" do
  #       expect {
  #         post "/api/v1/portfolios", params: { portfolio: valid_attributes }
  #       }.to change(Portfolio, :count).by(1)
  #       expect(response).to have_http_status(:success)
  #     end
  #   end
  # end

  # describe "PUT /api/v1/portfolios/:id" do
  #   context "with invalid parameters" do
  #     it "returns a 422 Unprocessable Entity status and error message" do
  #       put "/api/v1/portfolios/#{portfolio.id}", params: { portfolio: { name: "" } }
  #       expect(response).to have_http_status(:success)
  #       json = JSON.parse(response.body)
  #     end
  #   end
  # end

  # describe "DELETE /api/v1/portfolios/:id" do
  #   it "deletes the portfolio" do
  #     expect {
  #       delete "/api/v1/portfolios/#{portfolio.id}"
  #     }.to change(Portfolio, :count).by(-1)
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
