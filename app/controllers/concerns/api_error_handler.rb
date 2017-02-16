# frozen_string_literal: true
module Concerns
  module ApiErrorHandler
    extend ActiveSupport::Concern

    included do
      rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
    end

    private def api_error(status, message)
      render status: status, json: { error: status, error_description: message }
    end

    private def handle_record_not_found
      api_error :not_found, 'Resource could not be found.'
    end
  end
end
