# frozen_string_literal: true
module Model
  class ModelTypesSerializer < ActiveModelSerializers
    attributes :name, :total_price
  end
end
