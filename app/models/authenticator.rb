class Authenticator
  class_attribute :password

  attr_reader :session

  def initialize(session)
    @session = session
  end

  def authenticate(password)
    correct_password(password).tap do |valid|
      log_in if valid
    end
  end

  def log_in
    session[:logged_in] = true
  end

  def log_out
    session.delete(:logged_in)
  end

  def logged_in?
    !!session[:logged_in]
  end

  private

  def correct_password(password)
    password == self.class.password
  end
end
