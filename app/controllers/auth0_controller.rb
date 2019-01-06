# frozen_string_literal: true

class Auth0Controller < ApplicationController
  def success
    session[:userinfo] = request.env['omniauth.auth']

    redirect_to '/dashboard'
  end

  def failure
    @error_msg = request.params['message']
    head :ok
  end
end
