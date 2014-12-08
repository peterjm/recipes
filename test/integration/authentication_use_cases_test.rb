require 'test_helper'

class AuthenticationUseCasesTest < ActionDispatch::IntegrationTest
  test "view root page" do
    visit "/"
    assert_equal "/login", current_path
    log_in
    assert_equal "/", current_path
  end

  test "view non-root page" do
    visit "/recipes"
    assert_equal "/login", current_path
    log_in
    assert_equal "/recipes", current_path
  end

  test "log out" do
    visit "/login"
    log_in
    assert_equal "/", current_path
    click_link "Sign out"
    assert_equal "/login", current_path
  end
end
