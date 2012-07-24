require 'rubygems'
require 'bundler/setup'
require 'active_support/all'

require File.expand_path('../../lib/message-pubsub', __FILE__)
require 'mocha'

RSpec.configure do |config|
  config.color_enabled = true
  config.mock_framework = :mocha
  config.formatter = 'documentation'
end

class TestSubscriber; end