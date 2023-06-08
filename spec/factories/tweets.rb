# frozen_string_literal: true
FactoryBot.define do
  factory :tweet do
    user
    body { "Hello!" }
  end
end
