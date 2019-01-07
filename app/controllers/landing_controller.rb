# frozen_string_literal: true

class LandingController < ApplicationController
  include ApplicationHelper

  skip_before_action :ensure_login, only: :show

  def show
    redirect_to user_path(current_user) if logged_in?
  end
end
