# frozen_string_literal: true
module Pricing
  class Fixed < Base
    BASE_URL = 'https://developer.github.com/v3/#http-redirects'

    def initialize(_base_price)
      @base_price
    end

    def margin
      count_status(super)
    end

    private def count_status(_response)
      _response.scan(/\bstatus\b/i).count
    end
  end
end
