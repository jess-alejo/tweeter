require 'rails_helper'

RSpec.feature "User signin processes", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    visit new_user_session_path
  end

  it "signs me in" do
    within("#new_user") do
      fill_in 'Email address', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

end
