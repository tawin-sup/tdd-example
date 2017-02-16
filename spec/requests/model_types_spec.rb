# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ModelTypesController, type: :request do
  before do
    ENV["ACCESS_TOKEN"] = '123'
  end

  describe '#index' do
    context 'authentication' do
      let!(:model) { create(:model_with_model_types) }

      it 'should return authorization' do
        VCR.use_cassette('prestige') do
          get "/models/#{model.model_slug}/model_types", nil, Authorization: 'Token token="123"'
          expect(response).to have_http_status(:ok)
        end
      end

      it 'should return unauthorization' do
        VCR.use_cassette('prestige') do
          get "/models/#{model.model_slug}/model_types", nil, Authorization: 'Token token="321"'
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end

    context 'return model_types' do
      let!(:model) { create(:model_with_model_types) }

      before do
        VCR.use_cassette('prestige') do
          get "/models/#{model.model_slug}/model_types", nil, Authorization: 'Token token="123"'
        end
      end

      it 'return model_types for model' do
        VCR.use_cassette('prestige') do
          expect(response).to match_response_schema("model")
        end
      end
    end
  end
end
