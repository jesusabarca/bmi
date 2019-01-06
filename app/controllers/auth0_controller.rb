# frozen_string_literal: true

class Auth0Controller < ApplicationController
  include Auth0Helper

  skip_before_action :ensure_login, only: %i[success failure logout]

  def success
    session[:userinfo] = request.env['omniauth.auth']

    redirect_to '/dashboard'
  end

  def failure
    @error_msg = request.params['message']
    head :ok
  end

  def logout
    reset_session

    redirect_to auth0_logout_url
  end
end
