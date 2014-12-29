require 'test_helper'

class AuthenticatorTest < ActiveSupport::TestCase

  test "#log_in logs in" do
    auth.log_in
    assert auth.logged_in?
  end

  test "#log_out logs outs" do
    auth.log_out
    refute auth.logged_in?
  end

  test "#authenticate returns true if the google account is correct" do
    assert auth.authenticate(Authenticator.google_account)
    assert auth.logged_in?
  end

  test "#authenticate returns false if the google account is not correct" do
    refute auth.authenticate("bad account")
  end

  private

  def session
    @session ||= {}
  end

  def auth
    @auth ||= Authenticator.new(session)
  end

end
