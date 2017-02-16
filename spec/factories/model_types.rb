# frozen_string_literal: true
FactoryGirl.define do
  factory :model_type do
    name { Faker::Name.name }
    model_type_slug { Faker::Name.name.underscore }
    model_type_code { Faker::Number.between(1, 99).to_s }
    base_price { Faker::Number.normal(50, 3.5) }
  end
end
