# frozen_string_literal: true
module Pricing
  class Fixed < Base
    BASE_URL = 'https://developer.github.com/v3/#http-redirects'

    def initialize(_base_price)
      @base_price = _base_price
    end

    def margin
      count_status(super)
    end

    def total_price
      margin + @base_price
    end

    private def count_status(_response)
      _response.scan(/\bstatus\b/i).count
    end
  end
end
