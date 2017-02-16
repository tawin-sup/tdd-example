# frozen_string_literal: true
class ModelTypeSerializer < ActiveModel::Serializer
  attributes :name, :base_price, :total_price
end
