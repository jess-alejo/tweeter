require 'rails_helper'

RSpec.feature 'User signup process', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    visit new_user_registration_path
  end

  it "signs me up" do
    within("#new_user") do
      fill_in 'Email address', with:"name@cybersoftbpo.com"
      fill_in 'Password', with: "password"
      fill_in 'Password confirmation', with: 'password'
    end
    click_button 'Sign up'
    # Add assertions and expectations to verify the expected outcomes
    expect(page).to have_content 'Welcome! You have signed up successfully.'

  end

  end
