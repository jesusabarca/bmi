# frozen_string_literal: true

class Auth0Controller < ApplicationController
  include Auth0Helper

  skip_before_action :ensure_login, only: %i[success failure logout]

  before_action :set_user_session, only: :success

  def success
    redirect_to user_path(current_user)
  end

  def failure
    @error_msg = request.params['message']
    head :ok
  end

  def logout
    reset_session

    redirect_to auth0_logout_url
  end

  private

  def set_user_session
    session[:userinfo] = request.env['omniauth.auth']
  end
end
