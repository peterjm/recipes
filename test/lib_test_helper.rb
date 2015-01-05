require "minitest/autorun"
require 'minitest/pride'
require 'mocha/mini_test'
require "active_support"

require 'support/read_fixture'

ActiveSupport::TestCase.test_order = :random

$:.unshift File.expand_path('../lib', File.dirname(__FILE__))
