require 'rails_helper'


RSpec.describe PostsController, type: :controller do

  let(:valid_attributes) {
    { name: 'joe', surname: 'blogs', encrypted_email: 'joeblogs@gmail.com', encrypted_password: 'joeblogs22' }
  }

  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      user = User.create! valid_attributes
      post :create, params: { post: { message: "Hello, world!", user_id: user.id} }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      user = User.create! valid_attributes
      user.posts.create(message: "Hello, world!", user_id: user.id)
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
