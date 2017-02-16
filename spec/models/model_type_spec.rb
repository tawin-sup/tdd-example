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

  describe '#total_price' do
    let!(:base_price) { Faker::Number.between(1, 99) }
    let!(:total_price) { Faker::Number.between(1, 99) }
    let!(:model_type) { create(:model_type) }
    let!(:pricing_service) { double('pricing_service') }

    context 'call Fixed price for Fixed organization' do
      let!(:model) { create(:model_in_fixed) }

      before do
        model_type.model = model
        allow(Pricing::Fixed).to receive(:new).and_return(pricing_service)
        allow(pricing_service).to receive(:total_price).and_return(total_price)
      end

      it do
        expect(Pricing::Fixed).to receive(:new).with(model_type.base_price)
        model_type.total_price
      end
    end

    context 'call Fixed price for Flexible organization' do
      let!(:model) { create(:model_in_flexible) }

      before do
        model_type.model = model
        allow(Pricing::Flexible).to receive(:new).and_return(pricing_service)
        allow(pricing_service).to receive(:total_price).and_return(total_price)
      end

      it do
        expect(Pricing::Flexible).to receive(:new).with(model_type.base_price)
        model_type.total_price
      end
    end

    context 'call Fixed price for Prestige organization' do
      let!(:model) { create(:model_in_prestige) }

      before do
        model_type.model = model
        allow(Pricing::Prestige).to receive(:new).and_return(pricing_service)
        allow(pricing_service).to receive(:total_price).and_return(total_price)
      end

      it do
        expect(Pricing::Prestige).to receive(:new).with(model_type.base_price)
        model_type.total_price
      end
    end
  end
end
