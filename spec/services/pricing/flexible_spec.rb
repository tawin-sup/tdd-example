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

    context 'not count a in tag' do
      fake_html = <<-EOS
        <html>
          <head><title>Some Title</title></head>
          <body><a> test </a></body>
        </html>
      EOS
      it do
        allow(subject).to receive(:open).
          with('http://www.reuters.com').
          and_return(fake_html)
        expect(subject.margin).to equal(0.0)
      end
    end

    context 'Count a charactor' do
      fake_html = <<-EOS
        <html>
          <head><title>Some Title</title></head>
          <body>aaabbbccc</body>
        </html>
      EOS
      it do
        allow(subject).to receive(:open).
          with('http://www.reuters.com').
          and_return(fake_html)
        expect(subject.margin).to equal(3 / 100.00)
      end
    end

    context 'Not count a in style' do
      fake_html = <<-EOS
        <html>
          <head><title>Some Title</title></head>
          <body><style>aaaa</style></body>
        </html>
      EOS
      it do
        allow(subject).to receive(:open).
          with('http://www.reuters.com').
          and_return(fake_html)
        expect(subject.margin).to equal(0.0)
      end
    end

    context 'Not count a in script' do
      fake_html = <<-EOS
        <html>
          <head><title>Some Title</title></head>
          <body><script>aaaa</script></body>
        </html>
      EOS
      it do
        allow(subject).to receive(:open).
          with('http://www.reuters.com').
          and_return(fake_html)
        expect(subject.margin).to equal(0.0)
      end
    end
  end

  describe '#total_price' do
    it 'use base_price * margin' do
      allow(subject).to receive(:margin).and_return(20)
      expect(subject.total_price).to equal(base_price * 20)
    end
  end
end
