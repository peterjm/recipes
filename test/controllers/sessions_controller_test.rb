require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "#new renders the login page" do
    get :new
    assert_response :success
  end

  test "#new redirects to the root path if already logged in" do
    log_in
    get :new
    assert_redirected_to root_path
  end

  test "#create logs in and redirects to the return path" do
    session[:return_to] = recipes_path
    Authenticator.stubs(:password).returns("password")
    post :create, password: "password"
    assert_redirected_to recipes_path
  end

  test "#create with an invalid password renders the login path" do
    post :create, password: "bad password"
    assert_response :unprocessable_entity
    assert_template 'new'
  end

  test "#create redirects to the root path if already logged in" do
    log_in
    post :create
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
