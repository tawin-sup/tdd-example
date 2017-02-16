# frozen_string_literal: true
class Model < ActiveRecord::Base
  has_many :model_types

  belongs_to :organization

  validates_presence_of :name, :model_slug
  validates_uniqueness_of :name, :model_slug
end
