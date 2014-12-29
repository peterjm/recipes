class SessionsController < ApplicationController
  before_action only: [:new, :create, :error], if: :logged_in? do
    redirect_to root_path
  end

  def new
    redirect_to "/auth/google"
  end

  def create
    email = request.env["omniauth.auth"]['info']['email']
    if log_in!(email)
      redirect_to_return_path
    else
      redirect_to login_path
    end
  end

  def error
    redirect_to login_path
  end

  def destroy
    log_out!
    redirect_to login_path
  end

end
