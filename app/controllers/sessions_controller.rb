class SessionsController < ApplicationController

  before_action only: [:new, :create], if: :logged_in? do
    redirect_to root_path
  end

  respond_to :html

  def new
  end

  def create
    password = params.require(:password)
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
