require "minitest/autorun"
require 'minitest/pride'
require 'mocha/minitest'
require "active_support"

require 'support/read_fixture'

ActiveSupport::TestCase.test_order = :random

$:.unshift File.expand_path('../lib', File.dirname(__FILE__))
