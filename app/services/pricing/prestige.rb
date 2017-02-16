# frozen_string_literal: true
module Pricing
  class Prestige < Base
    BASE_URL = 'http://www.yourlocalguardian.co.uk/sport/rugby/rss/'

    def initialize(_base_price)
      @base_price = _base_price
    end

    def margin
      page = Nokogiri::XML(open(BASE_URL))
      response = parse_body(page)
      count_pub_date(response)
    end

    private def count_pub_date(response)
      response.count
    end

    private def parse_body(response)
      response.css('pubDate')
    end
  end
end
