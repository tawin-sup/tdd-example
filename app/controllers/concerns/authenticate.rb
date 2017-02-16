# frozen_string_literal: true
module Concerns
  module Authenticate
    extend ActiveSupport::Concern

    included do
      before_action :authenticate_token
    end

    def authenticate_token
      authenticate_or_request_with_http_token do |token|
        token == ENV['ACCESS_TOKEN']
      end
    end
  end
end
