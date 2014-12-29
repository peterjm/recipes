OmniAuth.config.test_mode = true

class ActiveSupport::TestCase

  def mock_omniauth(provider, credentials: {})
    info = credentials.merge(provider: provider.to_s).stringify_keys
    authhash = OmniAuth::AuthHash.new(info)
    OmniAuth.config.mock_auth[provider] = authhash
    yield authhash
  ensure
    OmniAuth.config.mock_auth[provider] = nil
  end

end
