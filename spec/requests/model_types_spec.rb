# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ModelTypesController, type: :request do
  before do
    ENV["ACCESS_TOKEN"] = '123'
  end

  describe '#index' do
    context 'authentication' do
      let!(:model) { create(:model_in_prestige) }
      let!(:model_type_1) { create(:model_type) }
      let!(:model_type_2) { create(:model_type) }

      it 'should return authorization' do
        get "/models/#{model.model_slug}/model_types", nil, Authorization: 'Token token="123"'
        expect(response).to have_http_status(:ok)
      end

      it 'should return unauthorization' do
        get "/models/#{model.model_slug}/model_types", nil, Authorization: 'Token token="321"'
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'return model_types' do
      let!(:model) { create(:model_in_prestige) }
      let!(:model_type_1) { create(:model_type) }
      let!(:model_type_2) { create(:model_type) }
      let!(:model_type_3) { create(:model_type) }

      before do
        model_type_1.model = model
        model_type_2.model = model
        model_type_3.model = model
        get "/models/#{model.model_slug}/model_types", nil, Authorization: 'Token token="123"'
      end


      it 'return model_types for model' do
        expect(response).to match_response_schema("model")
      end
    end
  end
end
