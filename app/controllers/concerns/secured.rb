# frozen_string_literal: true

module Secured
  extend ActiveSupport::Concern

  included do
    before_action :ensure_login
  end

  private

  def ensure_login
    redirect_to root_path if session[:userinfo].blank?
  end
end
