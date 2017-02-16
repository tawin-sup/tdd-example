# frozen_string_literal: true
class ModelsSerializer < ActiveModelSerializers
  attributes :name, :model_types

  def model_types
    object.model_types.map do |model_type|
      Model::ModelTypesSerializer.new(model_type)
    end
  end
end
