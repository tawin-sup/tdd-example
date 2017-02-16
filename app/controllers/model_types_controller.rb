# frozen_string_literal: true
class ModelTypesController < ApplicationController
  def index
    @model = Model.find_by!(model_slug: params[:model_slug])
    render json: { models: [serialized_model] }
  end

  def show
    @model_type = Model.find_by!(model_slug: params[:model_slug]).model_types.find_by!(model_type_slug: params[:model_type_slug])
    render json: { model_type: serialized_model_type }
  end

  private def serialized_model
    ModelSerializer.new(@model).as_json
  end

  private def serialized_model_type
    ModelTypeSerializer.new(@model_type).as_json
  end
end
