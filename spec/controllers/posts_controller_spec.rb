require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  xdescribe "GET /new " do
    it "responds with 200" do
      user = User.create(name: 'test', email: 'test@test.com', password: 'testey')
      get :index
      expect(response).to have_http_status(200)
    end
  end

  xdescribe "POST /" do
    it "responds with 200" do
      post :create, params: { post: { message: "Hello, world!" }, session: session[:user_id] = 2 }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      post :create, params: { post: { message: "Hello, world!" }, session: session[:user_id] = 2 }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  xdescribe "GET /" do
    it "responds with 200" do
      user = User.create(name: 'test', email: 'test@test.com', password: 'testey')
      get :index, params: { user_id: user.id }
      expect(response).to have_http_status(200)
    end
  end
end
