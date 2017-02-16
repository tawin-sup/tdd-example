class Model < ActiveRecord::Base
  validates_presence_of :name, :model_slug
  validates_uniqueness_of :name, :model_slug
end
