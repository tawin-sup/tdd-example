# frozen_string_literal: true
module Pricing
  class Fixed < Base

    def initialize(base_price)
      @base_price
    end

    def margin
    end

  end
end
