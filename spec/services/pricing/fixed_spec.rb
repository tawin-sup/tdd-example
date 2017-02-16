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

    it 'calls parse response' do
      VCR.use_cassette('github') do
        allow(subject).to receive(:parse_body).and_return('Status status')
        subject.margin
        expect(subject).to have_received(:parse_body)
      end
    end

    it 'calls count status response' do
      VCR.use_cassette('github') do
        allow(subject).to receive(:count_status).and_return(14)
        subject.margin
        expect(subject).to have_received(:count_status)
      end
    end

    context 'found status' do
      fake_html = <<-EOS
        <html>
          <head><title>Some Title</title></head>
          <body>Status status word html test</body>
        </html>
      EOS
      it do
        allow(subject).to receive(:open).
          with('https://developer.github.com/v3/#http-redirects').
          and_return(fake_html)
        expect(subject.margin).to equal(2)
      end
    end

    context 'not found status' do
      fake_html = <<-EOS
        <html>
          <head><title>Some Title</title></head>
          <body>word html test</body>
        </html>
      EOS
      it do
        allow(subject).to receive(:open).
          with('https://developer.github.com/v3/#http-redirects').
          and_return(fake_html)
        expect(subject.margin).to equal(0)
      end
    end

    context 'not count status in script tag' do
      fake_html = <<-EOS
        <html>
          <head><title>Some Title</title></head>
          <body>
              word html test
              <script> status </script>
          </body>
        </html>
      EOS
      it do
        allow(subject).to receive(:open).
          with('https://developer.github.com/v3/#http-redirects').
          and_return(fake_html)
        expect(subject.margin).to equal(0)
      end
    end

    context 'not count status in style tag' do
      fake_html = <<-EOS
        <html>
          <head><title>Some Title</title></head>
          <body>
              <style> status </style>
              word html test
          </body>
        </html>
      EOS
      it do
        allow(subject).to receive(:open).
          with('https://developer.github.com/v3/#http-redirects').
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
