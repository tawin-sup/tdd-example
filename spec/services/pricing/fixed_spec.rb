# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Pricing::Fixed, type: :service do
  let!(:base_price) { Faker::Number.between(1, 99) }
  subject { described_class.new(base_price) }

end
