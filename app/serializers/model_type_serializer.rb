# frozen_string_literal: true
class ModelTypeSerializer < ActiveModelSerializers
  attributes :name, :base_price, :total_price
end
