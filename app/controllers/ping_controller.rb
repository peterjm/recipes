class PingController < ActionController::Metal
  def ping
    self.response_body = "pong"
  end
end
