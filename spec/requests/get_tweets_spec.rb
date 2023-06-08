require 'rails_helper'

RSpec.describe "GetTweets", type: :request do
  let!(:tweet) { FactoryBot.create(:tweet, body: "Hello, world!") }

  describe "GET /tweets" do
    it "should return status OK" do
      get tweets_path

      expect(response).to have_http_status(200)
      expect(response.body).to include("Hello, world!")
    end
  end
end
