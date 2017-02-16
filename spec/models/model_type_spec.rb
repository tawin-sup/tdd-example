# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ModelType, type: :model do
  # Association
  it { is_expected.to belong_to(:model) }

  # Validation
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:model_type_slug) }
  it { is_expected.to validate_presence_of(:model_type_code) }
  it { is_expected.to validate_presence_of(:base_price) }

  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_uniqueness_of(:model_type_slug) }
  it { is_expected.to validate_uniqueness_of(:model_type_code) }
end
