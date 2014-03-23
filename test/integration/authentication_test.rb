require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  test "view root page" do
    visit "/"
    assert_equal login_path, current_path
    log_in
    assert_equal root_path, current_path
  end

  test "log out" do
    visit "/login"
    log_in
    assert_equal root_path, current_path
    click_link "Log out"
    assert_equal login_path, current_path
  end

  private

  def log_in
    fill_in 'Password', :with => Authenticator.password
    click_button 'Log in'
  end
end
