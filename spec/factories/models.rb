# frozen_string_literal: true
FactoryGirl.define do
  factory :model do
    name { Faker::Company.name }
    model_slug { Faker::Company.name.underscore }

    factory :model_in_fixed do
      association :organization, factory: :fixed_organization
    end

    factory :model_in_flexible do
      association :organization, factory: :flexible_organization
    end

    factory :model_in_prestige do
      association :organization, factory: :prestige_organization
    end
  end
end
