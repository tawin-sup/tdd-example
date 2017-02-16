# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Model, type: :model do
  # Association
  it { is_expected.to belong_to(:organization) }
  it { is_expected.to have_many(:model_types) }

  # Validation
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:model_slug) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_uniqueness_of(:model_slug) }
end
