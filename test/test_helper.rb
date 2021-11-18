ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require_relative 'sign_in_helper'
require 'rails/test_help'
require 'minitest/mock'
require 'simplecov'
SimpleCov.start 'rails'
require 'coveralls'
Coveralls.wear!('rails')

require_relative '../config/environment'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors) # SimpleCov測定時はオフ

  # Add more helper methods to be used by all tests here...
end
