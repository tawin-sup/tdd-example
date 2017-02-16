# frozen_string_literal: true
class ModelType < ActiveRecord::Base
  belongs_to :model

  validates_presence_of :name, :model_type_slug, :model_type_code, :base_price
  validates_uniqueness_of :name, :model_type_code, :model_type_slug
end
