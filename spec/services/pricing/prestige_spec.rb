# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Pricing::Prestige, type: :service do
  let!(:base_price) { Faker::Number.between(1, 99) }
  subject { described_class.new(base_price) }

  describe '#margin' do
    it 'returns Fixnum' do
      VCR.use_cassette('yourlocalguardian') do
        expect(subject.margin).to be_a(Integer)
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

    context 'Count epub date' do
      fake_html = <<-EOS
        <rss version="2.0"
            xmlns:atom="http://www.w3.org/2005/Atom">
          <item>
            <pubDate>Thu, 13 Oct 2016 15:56:26 +0100</pubDate>
          </item>
          <item>
            <pubDate>Thu, 13 Oct 2016 15:56:26 +0100</pubDate>
          </item>
        </rss>
      EOS
      it do
        allow(subject).to receive(:open).
          with('http://www.yourlocalguardian.co.uk/sport/rugby/rss/').
          and_return(fake_html)
        expect(subject.margin).to equal(2)
      end
    end

    context 'Count epub date' do
      fake_html = <<-EOS
        <rss version="2.0"
          xmlns:atom="http://www.w3.org/2005/Atom">
        <item>
        <item>
      </rss>
      EOS
      it do
        allow(subject).to receive(:open).
          with('http://www.yourlocalguardian.co.uk/sport/rugby/rss/').
          and_return(fake_html)
        expect(subject.margin).to equal(0)
      end
    end
  end

  describe '#total_price' do
    it 'use base_price + margin' do
      allow(subject).to receive(:margin).and_return(20)
      expect(subject.total_price).to equal(base_price + 20)
    end
  end
end
