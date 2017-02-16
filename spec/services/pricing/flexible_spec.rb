# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Pricing::Flexible, type: :service do
  let!(:base_price) { Faker::Number.between(1, 99) }
  subject { described_class.new(base_price) }

  describe '#margin' do
    it 'returns Fixnum' do
      VCR.use_cassette('router') do
        expect(subject.margin).to be_a(Float)
      end
    end

    it 'opens reuters url' do
      VCR.use_cassette('reuters') do
        allow(subject).to receive(:open).
            with('http://www.reuters.com')
        subject.margin
        expect(subject).to have_received(:open).
            with('http://www.reuters.com')
      end
    end
  end
end
