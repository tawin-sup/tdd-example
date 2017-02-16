# frozen_string_literal: true
require 'rails_helper'

describe ApplicationController, type: :controller do
  before do
    class AnonymousController < ApplicationController
      include Concerns::Authenticate
    end
  end

  subject do
    AnonymousController.new
  end

  context 'authenticate' do
    before do
      request.headers['Authorization'] = 'Token token="123"'
      ENV["ACCESS_TOKEN"] = '123'
      allow(subject).to receive(:request).and_return(request)
      allow(response).to receive(:response_code).and_return(200)
    end

    it { expect(subject.send(:authenticate_token)).to equal(true) }
  end
end
