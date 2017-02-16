# frozen_string_literal: true
module Pricing
  class Flexible < Base
    BASE_URL = 'http://www.reuters.com'

    def initialize(_base_price)
      @base_price = _base_price
    end

    def margin
      number_a = count_a(super)
      number_a / 100.00
    end

    private def count_a(_response)
      -1
    end

  end
end
