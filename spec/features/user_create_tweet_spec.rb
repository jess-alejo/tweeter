require 'rails_helper'

RSpec.feature 'Tweet Creation' do
  let(:user) { FactoryBot.create(:user) }
  
  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  it "User can create a tweet" do
    visit tweets_path
    click_link 'New tweet'
    fill_in 'tweet_body', with: 'Hello, world!'
    click_button 'Create Tweet'
   
    # Verify the tweet is displayed on the user's profile page
    expect(page).to have_content('Tweet was successfully created.')
    expect(page).to have_content('Hello, world!')
    end
end