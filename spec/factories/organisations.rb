# frozen_string_literal: true
FactoryGirl.define do
  factory :organization do
    name { Faker::Vehicle.manufacture }
    public_name { Faker::Vehicle.manufacture }

    factory :fixed_organization do
      organization_type { :show_room }
      pricing_policy { :fixed }
    end

    factory :flexible_organization do
      organization_type { :show_room }
      pricing_policy { :flexible }
    end

    factory :prestige_organization do
      organization_type { :show_room }
      pricing_policy { :prestige }
    end
  end
end
