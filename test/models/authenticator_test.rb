class AuthenticatorTest < ActiveSupport::TestCase

  test "#log_in logs in" do
    auth.log_in
    assert auth.logged_in?
  end

  test "#log_out logs outs" do
    auth.log_out
    refute auth.logged_in?
  end

  test "#authenticate returns true if the password is correct" do
    assert auth.authenticate(Authenticator.password)
    assert auth.logged_in?
  end

  test "#authenticate returns false if the password is correct" do
    refute auth.authenticate("bad password")
  end

  private

  def session
    @session ||= {}
  end

  def auth
    @auth ||= Authenticator.new(session)
  end

end
