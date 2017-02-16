# frozen_string_literal: true
class ModelSerializer < ActiveModel::Serializer
  attributes :name, :model_types

  def model_types
    object.model_types.map do |model_type|
      ModelEntry::ModelTypeSerializer.new(model_type)
    end
  end
end
