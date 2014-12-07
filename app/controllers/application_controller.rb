class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Presentable

  protected

  def return_to_path=(path)
    session[:return_to] = path
  end

  def redirect_to_return_path
    redirect_to session[:return_to] || root_path
    session.delete(:return_to)
  end

  def log_in!(password)
    authenticator.authenticate(password)
  end

  def log_out!
    authenticator.log_out
    reset_session
  end

  def logged_in?
    authenticator.logged_in?
  end
  helper_method :logged_in?

  def authenticator
    @authenticator ||= Authenticator.new(session)
  end
end
