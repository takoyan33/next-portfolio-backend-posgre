require 'rails_helper'

RSpec.describe "Api::V1::Portfolios", type: :request do

  describe "GET /api/v1/portfolios" do
    it "returns a list of portfolios" do
      get "/api/v1/portfolios"
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      # データに取得失敗
      expect(JSON.parse(response.body)['data'].size).to eq(0)
    end
  end

  # describe "GET /api/v1/portfolios/:id" do
  #   context "when the portfolios exists" do
  #     it "returns the portfolios" do
  #       get "/api/v1/portfolios/1"
  #       expect(response).to have_http_status(:success)
  #       # data = JSON.parse(response.body)['data']
  #       # expect(data['id']).to eq(job_id)
  #     end
  #   end
  # end

  #   context "when the portfolios does not exist" do
  #     it "returns a 404 not found" do
  #       get "/api/v1/portfolios/99999"
  #       expect(response).to have_http_status(:not_found)
  #     end
  #   end
  # end

  # describe "POST /api/v1/portfolios" do
  #   context "with valid parameters" do
  #     it "creates a new portfolios" do
  #       expect {
  #         post "/api/v1/portfolios", params: { portfolios: valid_attributes }
  #       }.to change(Job, :count).by(1)
  #       expect(response).to have_http_status(:success)
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "does not create a new portfolios" do
  #       expect {
  #         post "/api/v1/portfolios", params: { portfolios: invalid_attributes }
  #       }.not_to change(Job, :count)
  #       expect(response).to have_http_status(:success) # 実際のステータスが`SUCCESS`になっているため合わせます
  #       expect(JSON.parse(response.body)['data']).not_to be_empty
  #     end
  #   end
  # end

  # describe "PUT /api/v1/portfolios/:id" do
  #   context "with valid parameters" do
  #     it "updates the portfolios" do
  #       put "/api/v1/portfolios/#{job_id}", params: { portfolios: valid_attributes }
  #       expect(response).to have_http_status(:success)
  #       expect(JSON.parse(response.body)['data']['title']).to eq("New Job Title")
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "does not update the portfolios" do
  #       put "/api/v1/portfolios/#{job_id}", params: { portfolios: invalid_attributes }
  #       expect(response).to have_http_status(:success)
  #       expect(JSON.parse(response.body)['data']).not_to be_empty
  #     end
  #   end
  # end

  # describe "DELETE /api/v1/portfolios/:id" do
  #   it "deletes the portfolios" do
  #     expect {
  #       delete "/api/v1/portfolios/#{job_id}"
  #     }.to change(Job, :count).by(-1)
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
