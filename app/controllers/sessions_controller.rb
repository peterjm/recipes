class SessionsController < ApplicationController
  layout 'main'

  before_action only: [:new, :create], if: :logged_in? do
    redirect_to root_path
  end

  def new
  end

  def create
    password = params[:password]
    if log_in!(password)
      redirect_to_return_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out!
    redirect_to login_path
  end

end
