require 'rails_helper'

RSpec.describe Model, type: :model do
  # Validation
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:model_slug) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_uniqueness_of(:model_slug) }
end
