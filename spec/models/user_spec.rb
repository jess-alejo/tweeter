require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :tweets }
  it { should have_one_attached :avatar }

  let(:user) { FactoryBot.create(:user) }

  # Specification => Spec
  it "should have a full name" do
    user.assign_attributes(first_name: "John", last_name: "Doe")
    expect(user.full_name).to eq "John Doe" # assertion
  end

  context "#full_name" do
    it "should display last name if first_name is not available" do
      user.first_name = nil
      expect(user.full_name).to eq "Doe"
    end

    it "should display first name if last name is not available" do
      user.last_name = nil
      expect(user.full_name).to eq "John"
    end
  end
end
