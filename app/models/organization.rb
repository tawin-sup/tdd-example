# frozen_string_literal: true
class Organization < ActiveRecord::Base
  has_many :models

  enum organization_type: [:show_room, :service, :dealer]
  enum pricing_policy: [:flexible, :fixed, :prestige]

  validates_presence_of :name, :public_name, :organization_type, :pricing_policy
  validates_uniqueness_of :name, :public_name
end
