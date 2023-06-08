# frozen_string_literal: true
FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name  { "Doe" }
    email { Faker::Internet.email }
    password { "Password@123!" }
  end
end
