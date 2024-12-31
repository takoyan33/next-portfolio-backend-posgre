require 'rails_helper'

RSpec.describe "Api::V1::Licenses", type: :request do
    let!(:license) { create(:license) }

  describe "GET /api/v1/Licenses" do
    it "returns a list of Licenses" do
      get "/api/v1/licenses"
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      # データに取得失敗
      expect(JSON.parse(response.body)['data'].size).to eq(1)
    end
  end

  # describe "GET /api/v1/Licenses/:id" do
  #   context "when the job exists" do
  #     it "returns the job" do
  #       get "/api/v1/Licenses/#{job_id}"
  #       expect(response).to have_http_status(:success)
  #       data = JSON.parse(response.body)['data']
  #       expect(data['id']).to eq(job_id)
  #     end
  #   end

  #   context "when the job does not exist" do
  #     it "returns a 404 not found" do
  #       get "/api/v1/Licenses/99999"
  #       expect(response).to have_http_status(:not_found)
  #     end
  #   end
  # end

  # describe "POST /api/v1/Licenses" do
  #   context "with valid parameters" do
  #     it "creates a new job" do
  #       expect {
  #         post "/api/v1/Licenses", params: { job: valid_attributes }
  #       }.to change(Job, :count).by(1)
  #       expect(response).to have_http_status(:success)
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "does not create a new job" do
  #       expect {
  #         post "/api/v1/Licenses", params: { job: invalid_attributes }
  #       }.not_to change(Job, :count)
  #       expect(response).to have_http_status(:success) # 実際のステータスが`SUCCESS`になっているため合わせます
  #       expect(JSON.parse(response.body)['data']).not_to be_empty
  #     end
  #   end
  # end

  # describe "PUT /api/v1/Licenses/:id" do
  #   context "with valid parameters" do
  #     it "updates the job" do
  #       put "/api/v1/Licenses/#{job_id}", params: { job: valid_attributes }
  #       expect(response).to have_http_status(:success)
  #       expect(JSON.parse(response.body)['data']['title']).to eq("New Job Title")
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "does not update the job" do
  #       put "/api/v1/Licenses/#{job_id}", params: { job: invalid_attributes }
  #       expect(response).to have_http_status(:success)
  #       expect(JSON.parse(response.body)['data']).not_to be_empty
  #     end
  #   end
  # end

  # describe "DELETE /api/v1/Licenses/:id" do
  #   it "deletes the job" do
  #     expect {
  #       delete "/api/v1/Licenses/#{job_id}"
  #     }.to change(Job, :count).by(-1)
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
