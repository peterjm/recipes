ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'mocha/mini_test'
require 'capybara/rails'
require 'minitest/pride'
require 'webmock/minitest'

require 'support/omniauth'
require 'support/read_fixture'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  include FactoryGirl::Syntax::Methods
end

class ActionController::TestCase
  def log_in
    Authenticator.new(session).log_in
  end

  def logged_in?
    Authenticator.new(session).logged_in?
  end
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  protected

  def log_in
    mock_omniauth(:google, credentials: {info: {email: Rails.application.secrets.google_account}}) do
      visit "/login"
      click_link "Log in with Google"
    end
  end
end
