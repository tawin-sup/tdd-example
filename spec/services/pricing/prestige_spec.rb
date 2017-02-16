# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Pricing::Prestige, type: :service do
  let!(:base_price) { Faker::Number.between(1, 99) }
  subject { described_class.new(base_price) }

  it 'returns Float' do
    VCR.use_cassette('yourlocalguardian') do
      expect(subject.margin).to be_a(Float)
    end
  end

  it 'opens reuters url' do
    VCR.use_cassette('yourlocalguardian') do
      allow(subject).to receive(:open).
          with('http://www.yourlocalguardian.co.uk/sport/rugby/rss/')
      subject.margin
      expect(subject).to have_received(:open).
          with('http://www.yourlocalguardian.co.uk/sport/rugby/rss/')
    end
  end
end
