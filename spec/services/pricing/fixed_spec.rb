# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Pricing::Fixed, type: :service do
  let!(:base_price) { Faker::Number.between(1, 99) }
  subject { described_class.new(base_price) }

  describe '#margin' do
    it 'returns Fixnum' do
      VCR.use_cassette('github') do
        expect(subject.margin).to be_a(Integer)
      end
    end

    it 'opens github url' do
      VCR.use_cassette('github') do
        allow(subject).to receive(:open).
          with('https://developer.github.com/v3/#http-redirects')
        subject.margin
        expect(subject).to have_received(:open).
          with('https://developer.github.com/v3/#http-redirects')
      end
    end
  end
end
