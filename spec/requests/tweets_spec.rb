require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:tweet) { FactoryBot.create(:tweet, user: user, body: "Hello world") }

  before { sign_in user }

  describe "POST tweet" do
    it "should creates a new tweet" do
      # tweet = Tweet.new(body: "Hello world")
      expect(tweet.body).to eq "Hello world"
    end
  end

  describe "PATCH update" do
    it "updates the tweets body" do
      patch "/tweets/#{tweet.id}", params: { tweet: { body: "Updated tweet" } }
      tweet.reload

      expect(tweet.body).to eq("Updated tweet")
    end
  end

end
