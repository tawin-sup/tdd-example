# frozen_string_literal: true
class ModelType < ActiveRecord::Base
  belongs_to :model

  validates_presence_of :name, :model_type_slug, :model_type_code, :base_price
  validates_uniqueness_of :name, :model_type_code, :model_type_slug

  def total_price
    case model.organization.pricing_policy
    when 'flexible'
      Pricing::Flexible.new(base_price).total_price
    when 'fixed'
      Pricing::Fixed.new(base_price).total_price
    when 'prestige'
      Pricing::Prestige.new(base_price).total_price
    end
  end
end
