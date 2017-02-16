# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ModelTypesController, type: :request do
  before do
    ENV["ACCESS_TOKEN"] = '123'
  end

  describe '#index' do
    it 'should return authorization' do
      get '/models/test/model_types', nil, Authorization: 'Token token="123"'
      expect(response).to have_http_status(:ok)
    end

    it 'should return unauthorization' do
      get '/models/test/model_types', nil, Authorization: 'Token token="321"'
      expect(response).to have_http_status(:unauthorized)
    end

  end
end
