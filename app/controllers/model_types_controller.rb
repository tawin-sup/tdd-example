# frozen_string_literal: true
class ModelTypesController < ApplicationController
  def index
    @model = Model.find_by!(model_slug: params[:model_slug])
    render json: {models: [serialized_model]}
  end

  def show
    render json: []
  end

  private def serialized_model
    ModelSerializer.new(@model).as_json
  end
end
