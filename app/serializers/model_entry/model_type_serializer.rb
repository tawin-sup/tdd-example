# frozen_string_literal: true
module ModelEntry
  class ModelTypeSerializer < ActiveModel::Serializer
    attributes :name, :total_price
  end
end
