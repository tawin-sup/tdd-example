# frozen_string_literal: true
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/cassettes'
  config.hook_into :webmock
  config.ignore_hosts '127.0.0.1', 'localhost'
end
