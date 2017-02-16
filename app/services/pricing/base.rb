# frozen_string_literal: true
require 'open-uri'

module Pricing
  class Base
    def margin
      page = Nokogiri::HTML(open(self.class::BASE_URL))
      parse_body(page)
    end

    protected def parse_body(response)
      response.xpath("//script").remove
      response.xpath("//style").remove
      response.css('body').inner_text
    end
  end
end
