# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Secured

  def current_user
    @current_user ||= User.where(email: email_from_session).first_or_create! do |user|
      user.name = name_from_session
    end
  end

  private

  def email_from_session
    session[:userinfo].to_h.dig 'info', 'email'
  end

  def name_from_session
    session[:userinfo].to_h.dig 'info', 'name'
  end
end
