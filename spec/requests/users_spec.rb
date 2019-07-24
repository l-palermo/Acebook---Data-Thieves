require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET homepage" do
    xit "acebook homepage" do
      get '/'
      expect(response).to have_http_status(200)
    end
  end
end
