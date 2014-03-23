class AuthenticatedController < ApplicationController
  layout 'main'

  before_action :require_login

  private

  def require_login
    self.return_to_path = request.path
    redirect_to login_path unless logged_in?
  end
end
