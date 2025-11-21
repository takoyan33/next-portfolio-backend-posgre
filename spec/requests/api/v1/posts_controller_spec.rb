require 'rails_helper'

RSpec.describe "Api::V1::Posts", type: :request do
  let!(:post) { create(:post) }

  describe "GET /api/v1/posts" do
    it "returns a list of posts" do
      get "/api/v1/posts"
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json['status']).to eq('SUCCESS')
      expect(json['data'].size).to eq(1)
    end
  end

  describe "GET /api/v1/posts/:id" do
    it "returns the post" do
      get "/api/v1/posts/#{post.id}"
      expect(response).to have_http_status(:success)
      
      json = JSON.parse(response.body)
      expect(json['status']).to eq('SUCCESS')
      expect(json['data']['id']).to eq(post.id)
      expect(json['data']['title']).to eq(post.title)
    end
  end

  describe "POST /api/v1/posts" do
    context "with valid parameters" do
      let(:valid_attributes) { { title: "New Post Title" } }

      it "creates a new post" do
        expect {
          post "/api/v1/posts", params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
        expect(response).to have_http_status(:success)
        
        json = JSON.parse(response.body)
        expect(json['status']).to eq('SUCCESS')
        expect(json['data']['title']).to eq('New Post Title')
      end
    end
  end

  describe "PUT /api/v1/posts/:id" do
    context "with valid parameters" do
      it "updates the post" do
        put "/api/v1/posts/#{post.id}", params: { post: { title: "Updated Title" } }
        expect(response).to have_http_status(:success)
        
        json = JSON.parse(response.body)
        expect(json['status']).to eq('SUCCESS')
        expect(json['message']).to eq('Updated the post')
        
        post.reload
        expect(post.title).to eq('Updated Title')
      end
    end
  end

  describe "DELETE /api/v1/posts/:id" do
    it "deletes the post" do
      expect {
        delete "/api/v1/posts/#{post.id}"
      }.to change(Post, :count).by(-1)
      expect(response).to have_http_status(:success)
      
      json = JSON.parse(response.body)
      expect(json['status']).to eq('SUCCESS')
      expect(json['message']).to eq('Deleted the post')
    end
  end
end
