require 'rails_helper'

RSpec.describe Organization, type: :model do
  # Association
  it { is_expected.to have_many(:models) }

  # Define Enum
  it { is_expected.to define_enum_for(:organization_type).with([:show_room, :service, :dealer]) }
  it { is_expected.to define_enum_for(:pricing_policy).with([:flexible, :fixed, :prestige]) }

  # Validation
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:public_name) }
  it { is_expected.to validate_presence_of(:organization_type) }
  it { is_expected.to validate_presence_of(:pricing_policy) }

  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_uniqueness_of(:public_name) }
end
