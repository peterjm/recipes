require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "#new renders the login page" do
    get :new
    assert_response :success
    assert_template 'new'
  end

  test "#new redirects to the root path if already logged in" do
    log_in
    get :new
    assert_redirected_to root_path
  end

  test "#create logs in and redirects to the return path" do
    session[:return_to] = recipes_path
    Authenticator.stubs(:google_account).returns("foo@bar.com")
    mock_omniauth(:google, credentials: {info: {email: 'foo@bar.com'}}) do |auth|
      request.env["omniauth.auth"] = auth
      get :create
    end
    assert_redirected_to recipes_path
  end

  test "#create with an invalid google account redirects to the new path" do
    Authenticator.stubs(:google_account).returns("foo@bar.com")
    mock_omniauth(:google_oauth2, credentials: {info: {email: 'foo2@bar.com'}}) do |auth|
      request.env["omniauth.auth"] = auth
      get :create
    end
    assert_response :unprocessable_entity
    assert_template 'new'
  end

  test "#create redirects to the root path if already logged in" do
    log_in
    get :create
    assert_redirected_to root_path
  end

  test "#error redirects to the login path" do
    get :error
    assert_response :unprocessable_entity
    assert_template 'new'
  end

  test "#error redirects to the root path if already logged in" do
    log_in
    get :error
    assert_redirected_to root_path
  end

  test "#destroy clears the current session" do
    log_in
    delete :destroy
    refute logged_in?
  end

  test "#create redirects to the login path" do
    delete :destroy
    assert_redirected_to login_path
  end

end
