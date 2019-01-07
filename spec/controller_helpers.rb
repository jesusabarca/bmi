module ControllerHelpers
  def mock_login(user)
    session[:userinfo] = OmniAuth.config.mock_auth[:auth0]
    allow(@controller).to receive(:current_user) { user }
  end
end
